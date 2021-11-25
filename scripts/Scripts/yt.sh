#!/usr/bin/sh

player="$BROWSER"
invurl=""
result_file=""

# Get the link of a working instance of invidiuos (temporarily idempotent)
get_inv_link() {
	local invhtml_link='https://api.invidious.io/'

	local invhtml_file="/tmp/inv_$(printf "%s" "$invhtml_link" | base32 -)"
	if [[ ! -f "$invhtml_file" ]]; then
		curl "$invhtml_link" > "$invhtml_file"
	fi

	invurl="$(grep -Po "(?<=<td><a href=\")https?:\/\/[a-zA-Z0-9\.]+" "$invhtml_file" | head -n 1 | sed -E 's/\/$//g')"
}

get_yt_results() {
	local search_string
	search_string=""$invurl"/search?q="$(printf "%s\n" "$*" | sed -E 's/[[:space:]]/+/g')""
	result_file="/tmp/invsearch_$(printf "%s" "$search_string" | base32 -)"

	if [[ ! -f "$result_file" ]]; then
		curl "$search_string" | grep 'a href=\"\/watch?v' | awk -F "[\"<>]" "{print \"$invurl\" \$5 \" \" \$7}" > "$result_file"
	fi
}

repl() {
	local total_lines
	total_lines="$(cat "$result_file" | wc -l)"
	clear
	while true; do
		cut -d " " -f 2- "$result_file" | nl 
		printf "\x1b[1m"
		read -p "> " -e input
		printf "\x1b[0m"
		if [ "$input" -gt 0 ] && [ "$input" -le "$total_lines" ]; then
			sed ""$input"q;d" "$result_file" | cut -d " " -f 1 | xargs "$player"
			exit 0
		else
			printf "%s: Out of Range\n" "$input"
			continue
		fi
	done
}
get_inv_link
get_yt_results "$*"
repl
