#!/bin/bash

# Government 1B
# https://tomwoods.s3.amazonaws.com/govlesson1.mp4 to 90
# https://www.ronpaulcurriculum.com/public/2634.cfm

# Western Civilization 2
# https://tomwoods.s3.amazonaws.com/wciv2lesson2.mp4
# 33 weeks http://tomwoodshomeschool.com/western-civilization-from-1493/

# WC 1 some are titled lecture some lesson
# https://tomwoods.s3.amazonaws.com/lecture1.mp4 to https://tomwoods.s3.amazonaws.com/lecture179.mp4
# https://www.ronpaulcurriculum.com/public/1003.cfm
# 36 weeks http://tomwoodshomeschool.com/western-civ/
i=70
e=181
domain=https://tomwoods.s3.amazonaws.com/
# filepattern=lecture
filepattern=lesson
# filepattern=wciv2lesson

while [ $i -le $e ]
do
  file=$filepattern$i.mp4
  echo Downloading - "$file"
  echo curl -O $domain$file
  curl -O $domain$file
  ((i++))
done
say "all done"
