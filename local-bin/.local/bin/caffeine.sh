#!/bin/bash
status=`xset -q | grep 'DPMS is' | awk '{ print $3 }'`
if [ $status == 'Enabled' ]; then
    xset s off && \
    xset -dpms && \
    dunstify 'Screen suspend is disabled.'
else
    xset +dpms && \
    xset s 900 && \
    dunstify 'Screen suspend is enabled.'
fi
