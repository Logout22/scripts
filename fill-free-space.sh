#!/bin/bash
set -eu
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <target path> <1K blocks to fill>"
    exit 1
fi
TARGET_PATH=$1
FREE_BLOCKS=$2
(( FILE_SIZE_IN_BLOCKS = 1024 * 1024 * 3 ))
(( FILE_COUNT = FREE_BLOCKS / FILE_SIZE_IN_BLOCKS ))
(( LAST_FILE_BLOCKS = FREE_BLOCKS - ( FILE_COUNT * FILE_SIZE_IN_BLOCKS ) ))
for next_file in $(seq 0 $FILE_COUNT); do
  BLOCK_COUNT=$FILE_SIZE_IN_BLOCKS
  if [ "$next_file" -eq $FILE_COUNT ]; then BLOCK_COUNT=$LAST_FILE_BLOCKS; fi
  echo "Writing $next_file"
  dd if=/dev/urandom of="$TARGET_PATH/fill${next_file}.dat" ibs=1024 count=$BLOCK_COUNT status=progress
done
echo "Medium should be full now"
df -h
for file in $(seq 0 $FILE_COUNT); do
  echo "Removing $file"
  rm -f "$TARGET_PATH/fill${file}.dat"
done
