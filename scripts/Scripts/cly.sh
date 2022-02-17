#!/usr/bin/bash

cache_dir="$HOME/.cache/clyrics"
cache_file_name="$cache_dir"/"$(echo "$@" | sed "s/[[:space:]]/_/g")".lyrics

if ! [ -f "$cache_file_name" ]; then
	clyrics "$@" > "$cache_file_name"
fi
less "$cache_file_name"
