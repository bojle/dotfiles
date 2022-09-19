#!/usr/bin/sh

## A wrapper around https://github.com/trizen/clyrics that caches
## the downloaded lyrics and uses a pager (less) to display it.

## TODO: Add regular expression based cache database search


usage() {
	cat << END
A wrapper around https://github.com/trizen/clyrics that caches
the lyrics for faster access and uses a pager (less) to display it.

cly -h
	Print this Message and Exit
cly [Name of the Song]
	Argument(s) should include the name of the song and 
	(optionally) the artist name. These arguments are 
	read by a search engine, therefore, more the keywords
	better the chances of the lyrics being fetched.

Examples:
	cly dracula from houston
	cly "dracula from houston"
	cly smoko the chats

Report Issues to: https://github.com/bojle
END
}

main() {
	if [ "$1" = "-h" ]; then
		usage
		exit 0
	fi

	cache_dir="$HOME/.cache/clyrics"
	cache_file_name="$cache_dir"/"$(echo "$@" | sed "s/[[:space:]]/_/g")".lyrics
	tmp_file="/tmp/cly.tmp"

	mkdir "$cache_dir" 2>/dev/null
	if ! [ -f "$cache_file_name" ]; then
		clyrics "$@" > "$tmp_file"
		if [ -s "$tmp_file" ]; then  # If size of $tmp_file is non-zero
			cp "$tmp_file" "$cache_file_name"
		else 
			echo "Couldn't find the lyrics for: "$@""
			exit 1
		fi
	fi

	if ! [ -z "$PAGER" ]; then
		"$PAGER" "$cache_file_name"
	else 
		less "$cache_file_name"
	fi
}

main "$@"
