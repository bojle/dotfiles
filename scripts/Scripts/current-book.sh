#!/bin/bash

cb="$HOME/.local/share/current-book.txt"
if [ "$1" = "-s" ]; then
	echo "$2" > "$cb"
else
	cat "$cb"
fi

