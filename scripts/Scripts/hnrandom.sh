#!/usr/bin/sh
year=$[ 2007 + ( $RANDOM % 13 ) ]
month=$[ $RANDOM % 12 + 1 ]
day=$[ $RANDOM % 30 + 1 ]
firefox "news.ycombinator.com/front?day=$year-$month-$day"

# https://wiby.me/surprise
