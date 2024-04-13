#!/bin/sh
set -eu

cd "$HOME/Handy Backup"
rsync-confirmed -e 'ssh -p 2222' --exclude .thumbnails user@OnePlus-8-Pro:/sdcard/{DCIM,Download,Movies,Pictures,Track\ Time} .
echo Backing up WhatsApp folder
ssh -p 2222 user@OnePlus-8-Pro 'tar -c -C /sdcard/Android/media/com.whatsapp WhatsApp' | pigz > Android/media/com.whatsapp/WhatsApp.tar.gz

