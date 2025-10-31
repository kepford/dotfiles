#!/bin/bash
x="$1"
y=${x%.gif}
echo ${y##*/} | pbcopy

