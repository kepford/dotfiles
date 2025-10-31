#!/bin/bash
# Move all files that end with .txt to a new directory renaming them to the name of their parent
# directory. This only works if there is one file with an extension per directory.
# Run in the directory and files will be moved to a directory named new-files at the same level
# as the source directory.
for name in */*.txt
do
    cp "$name" "../new-files/$(basename -- "$(dirname -- "$name")").txt"
done
