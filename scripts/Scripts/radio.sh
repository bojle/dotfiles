#!/usr/bin/sh
# Randomly play/repl m4b files from $musicdir directory 
# Usage:
# 	Play a random file: radio -r	
#	Open repl: radio


musicdir="$HOME"/radio
play() {
	printf "%s\n" "Playing file $1"
	mpv "$1"
}

PS3="play> "
case "$1" in
	"-r")
		file="$(find "$musicdir" -maxdepth 1 -printf "%p\n" | shuf -n 1)"
		play "$file"
		;;
	*)
		cd "$musicdir"
		select file in *; do
			play ""$musicdir"/"$file""
		done
		;;
esac
