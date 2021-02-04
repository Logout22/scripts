#!/bin/bash
set -o errexit
set -o nounset

cleanup() {
    rm -rf "$tmpdir"
}

write_random_data() {
    mkfifo "$tmpdir/hdout"
    dd if=/dev/urandom bs=4K count=$2 status=none \
        | tee "$tmpdir/hdout" \
        | sha256sum > "$tmpdir/writesum.sha256sum" &
    dd if="$tmpdir/hdout" of="$1" oflag=sync bs=4K status=progress
    wait $(jobs -p)
    echo "Finished writing; checksum:"
    cat "$tmpdir/writesum.sha256sum"
}

read_random_data() {
    dd if="$1" iflag=sync bs=4K count=$2 status=progress \
        | sha256sum > "$tmpdir/readsum.sha256sum"
    echo "Finished reading back; checksum:"
    cat "$tmpdir/readsum.sha256sum"
}

check_random_data() {
    if cmp "$tmpdir/writesum.sha256sum" "$tmpdir/readsum.sha256sum"; then
        echo "Data successfully retrieved!"
    fi
}

tmpdir=$(mktemp -d)
trap cleanup EXIT
write_random_data "$@"
read_random_data "$@"
check_random_data
