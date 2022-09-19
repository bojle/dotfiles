#!/bin/bash

/usr/bin/pcmanfm 1>&2 2>/dev/null &
sleep 1
kill -9 "$(ps -eO cmd | grep '/usr/bin/pcmanfm' | head -n 1 | xargs | cut -d " " -f 1)"
cp "$1" /run/media/metal/RPI-RP2/
