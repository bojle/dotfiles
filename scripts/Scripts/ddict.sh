#!/bin/sh
if [ -n "$1" ]; then
	i="$1"
else
	i=1
fi
grep -F "**" "$HOME"/Notes/other/vocab.md | shuf -n "$i" | sed 's/**//g' 
