#!/usr/bin/bash

urlopen() {
	qutebrowser "$1"
}

# Used to uniquely identify a url (for cache purposes)
# (Sum of decimal ascii values of chars)
hashfn() {
	local code=0
	for ((i=0;i<${#1};++i)); do
		code=$(( code + "$(printf "%d" \'${1:i:1})" ))
	done
	printf "%d" "$code"
}

url="$(xclip -selection clipboard -o)"
identifier="$(hashfn "$url")"

if [ "$1" == "-s" ]; then
	file="rdr_${identifier}.html"
else
	file="/tmp/rdr_${identifier}.html"
fi

if [ ! -f "${file}" ]; then
	rdrview -H "$url" > "$file"
	sed -i '1i <link rel="stylesheet" href="/home/metal/Scripts/css/simple.css">' "$file"
fi
urlopen "${file}"
