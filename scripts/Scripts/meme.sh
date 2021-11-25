#!/usr/bin/sh

if [ $# -ge 1 ]; then 
	wget "$(xclip -selection clipboard -o)" -O ~/Pictures/Meme/"$1"
fi
