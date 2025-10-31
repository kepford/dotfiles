#!/bin/sh
for f in *.mp4; do ffmpeg -i "$f" -acodec libmp3lame -ac 2 -ab 160k -ar 48000 newfiles/"${f%.m4a}.mp3"; done
