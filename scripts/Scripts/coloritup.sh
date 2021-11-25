#!/usr/bin/sh

word="$1"

printf "\x1b[1J\x1b[H"
while true
do
	c1=$[ 31 + ( $RANDOM % 7 ) ]
	c2=$[ 31 + ( $RANDOM % 7 ) ]
	c3=$[ 31 + ( $RANDOM % 7 ) ]
	c4=$[ 31 + ( $RANDOM % 7 ) ]
	printf "\x1b[1J\x1b[H\x1b[${c1}mU\x1b[${c2}mN\x1b[${c3}mI\x1b[${c4}mX\n"
done
