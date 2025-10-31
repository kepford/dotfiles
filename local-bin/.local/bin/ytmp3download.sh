#!/bin/sh

echo "Starting download now"
yt-dlp --verbose "$1" -i -x --audio-format=mp3 --yes-playlist -o "%(title)s.%(ext)s"
