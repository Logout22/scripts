#!/bin/sh
set -o errexit
set -o nounset

SOURCE=$1
TARGET=$2
# TODO adapt channel info before download
youtube-dl -f 'http-h264_aac_mp4_http_na_na-veryhigh-0' -o "$TARGET-video.tmp" "$1"
youtube-dl -f 'hls-aac-Originalton_englisch-0' -o "$TARGET-audio.tmp" "$1"
ffmpeg -i "$TARGET-video.tmp" -i "$TARGET-audio.tmp" -map 0:0 -map 1:0 -map 0:1 -c:v copy -c:a copy "$TARGET.mkv"
