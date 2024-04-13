#!/bin/sh
set -eu

cd "$HOME/Handy Backup"
rsync-confirmed -e 'ssh -p 2222' --exclude .thumbnails user@OnePlus-8-Pro:/sdcard/{DCIM,Download,Movies,Pictures,Track\ Time} .

