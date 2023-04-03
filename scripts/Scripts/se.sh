#!/usr/bin/sh
#
# By github.com/bojle
#
# Script to search across various search engines
# Usage:
# 	se yt crystal castles crimewave
# 	se wh clutter
# 	se ur charizarding
# What each keyword means can be infered from looking
# at the function that implements it.
#
# To add a new keyword, simply add a function with the global
# 'url' variable appropriately set.

# Convert spaces to whatever is $1
spaceto() {
	to="$1"
	shift 1
	echo "$@" | sed "s/[[:space:]]/$to/g"
}

yt() {
	url="https://youtube.com/results?search_query=$(spaceto + "$@")"
}

gi() {
	url="https://duckduckgo.com/?q=$(spaceto + "$@")&iax=images&ia=images"
}

wi() {
	url="https://wikipedia.org/wiki/$(spaceto _ "$@")"
}

am() {
	url="https://www.amazon.in/s?k=$(spaceto + "$@")"
}

wh() {
	url="https://www.wordhippo.com/what-is/another-word-for/$(spaceto _ "$@").html"
}

wha() {
	url="https://www.wordhippo.com/what-is/the-opposite-of/$(spaceto _ "$@").html"
}

ur() {
	url="https://www.urbandictionary.com/define.php?term=$(spaceto + "$@")"
}

wb() {
	url="https://wiby.me/?q=$(spaceto + "$@")"
}

de() {
	url="http://search.disroot.org/search?q=$(spaceto + "$@")&categories=general&language=en-US"
}

git() {
	url="https://git-scm.com/docs/git-"$@""
}

cnf() {
	url="https://command-not-found.com/"$@""
}

at="$1"
url=""
shift 1
"$at" "$@"
"$BROWSER" "$url" 1>/dev/null 2>/dev/null &
