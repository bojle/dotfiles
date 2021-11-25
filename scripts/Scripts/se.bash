#!/usr/bin/bash

get_inv_link() {
	local invhtml_link='https://api.invidious.io/'

	local invhtml_file="/tmp/inv_$(printf "%s" "$invhtml_link" | base32 -)"
	if [[ ! -f "$invhtml_file" ]]; then
		curl "$invhtml_link" > "$invhtml_file"
	fi

	local url="$(grep -Po "(?<=<td><a href=\")https?:\/\/[a-zA-Z0-9\.]+" "$invhtml_file" | shuf -n 1 | sed -E 's/\/$//g')"
	printf "%s" "$url" | xclip -selection clipboard -i
	printf "%s\n" "$url"
}

get_inv_link
