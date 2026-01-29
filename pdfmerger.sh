#!/bin/bash -eu
pdfseparate ../odd.pdf odd_page_%d.pdf
pdfseparate ../even.pdf even_page_%d.pdf

output="interleaved.pdf"
page_num=1

while [[ -f "odd_page_$page_num.pdf" && -f "even_page_$page_num.pdf" ]]; do
    pdftk "odd_page_$page_num.pdf" "even_page_$page_num.pdf" cat output temp.pdf
    if [[ -f "$output" ]]; then temp_output="$output temp.pdf"; else temp_output=temp.pdf; fi
    pdftk $temp_output cat output temp_combined.pdf
    mv temp_combined.pdf "$output"
    ((page_num++))
done
