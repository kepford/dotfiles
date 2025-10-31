#!/bin/sh

# execute in directory full of mkv files.
for f in *.mkv;
  do ffmpeg -i "$f" -c copy "${f%.mkv}.mp4";
done
