#!/bin/sh
for f in *.webm; do ffmpeg -fflags +genpts -i "$f" -r 24 newfiles/"${f%.m4a}.mp4"; done
