#!/bin/bash
set -o errexit
set -o nounset

cleanup() {
    rm -f hdout
}

if [[ -e hdout ]]; then exit 42; fi
mkfifo hdout
trap cleanup EXIT
dd if=/dev/urandom bs=4K count=$2 status=none | tee hdout | sha256sum &
sudo dd if=hdout of="$1" oflag=sync bs=4K status=progress
wait $(jobs -p)
echo Finished writing
sudo dd if="$1" iflag=sync bs=4K count=$2 status=progress | sha256sum
echo Finished reading back
