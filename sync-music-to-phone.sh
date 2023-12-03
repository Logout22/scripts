#!/bin/sh
rsync-confirmed -e 'ssh -p 2222' --exclude .thumbnails /data/Musik/ user@OnePlus-8-Pro:/sdcard/Music/

