#!/bin/sh
SOURCE=$1
DEST=$2
# Ensure that the source is set.
if [ -z "$SOURCE" ]
then
      echo "You must provide a \$SOURCE as an arguement to the command."
			exit 1
fi

if [ -z "$DEST" ]
then
      echo "You must provide both a Source and Destination as arguements. \$DEST is NULL"
			exit 1
fi

echo Converting "$SOURCE" to "$DEST"
#ffmpeg -i "$SOURCE" -ac 1 -ab 128000 -f mp4 -acodec libfdk_aac -y "$DEST".m4r
ffmpeg -i "$SOURCE" -ac 1 -ab 128000 -f mp4 -acodec aac "$DEST".m4r
