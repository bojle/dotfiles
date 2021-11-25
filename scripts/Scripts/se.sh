#!/usr/bin/sh

# Convert spaces to whatever is $1
spaceto() {
	to="$1"
	shift 1
	echo "$@" | sed "s/[[:space:]]/$to/g"
}

yt() {
	url="https://youtube.com/results?search_query=$(spaceto + "$@")"
}

# 4chan archive 
fa() {
	board="$1"
	shift 1
	url="https://duckduckgo.com/?q=$(spaceto + "$@")+site:4chanarchives.com/board/$board&t=h_&ia=web"
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

ur() {
	url="https://www.urbandictionary.com/define.php?term=$(spaceto + "$@")"
}

wb() {
	url="https://wiby.me/?q=$(spaceto + "$@")"
}

de() {
	url="http://search.disroot.org/search?q=$(spaceto + "$@")&categories=general&language=en-US"
}
at="$1"
url=""
shift 1
"$at" "$@"
"$BROWSER" "$url" 1>/dev/null 2>/dev/null &
