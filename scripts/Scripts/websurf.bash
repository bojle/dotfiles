#!/usr/bin/bash

# To add a site: Add the name of a function in the $sites array and then 
# create the function which updates the global $argstring
argstring=""
declare -a sites=("linuxgazette" "hn" "wikiweb" "wiby" "lesswrong")

function usage() {
	cat << END
websurf -h: print this message
websurf [site]: go to [site]
websurf (no arguments): go to a random [site]
[site] includes:
${sites[@]}
END
}


function linuxgazette() {
	local issue=$(( RANDOM % 186 + 1 ))
	argstring="https://linuxgazette.net/$issue/index.html"
}

function hn() {
	local year=$(( 2007 + ( RANDOM % 13 ) ))
	local month=$(( RANDOM % 12 + 1 ))
	local day=$(( RANDOM % 30 + 1 ))
	argstring="https://news.ycombinator.com/front?day=$year-$month-$day"
}

function wikiweb() {
	argstring="https://wiki.c2.com/?RandomPages"
}

function wiby() {
	printf "From wiby\n"
	argstring="https://wiby.me/surprise/"
}

function kragen() {
	local year=$(( 1999 + ( RANDOM % 12 ) ))
	local month=$(( 1 + ( RANDOM % 11 ) ))
	local monthname
	monthname=$(date -d "$year-$month-21" "+%B")
	local url="https://archive.org/wayback/available?url=https://lists.canonical.org/pipermail/kragen-tol/$year-$monthname/thread.html"
	printf "Requesting JSON...\n"
	argstring=$(curl -s "$url" | jq .archived_snapshots.closest.url | sed 's/\"//g')
	if [ "$argstring" == "null" ]; then
		kragen
	fi
}

#function 1mbclub() {
#	printf "From 1mbclub\n"
#	argstring=$(curl "https://1mb.club" | grep "href=\"https:" | cut -d \" -f 2 | shuf | tail -1)
#}

function lesswrong() {
	local rand_offset=$(( ( RANDOM % 20000 ) + 1 ))
	rand_offset=$(echo "
	define iseven(x) {
		return (x % 2);
	}
	define mul_of_20(x) {
		var = x / 10;
		if (iseven(var)) {
			return ((var + 1) * 10);
		}
		return (var * 10);
	}
	mul_of_20($rand_offset);" | bc )

	local url="https://www.greaterwrong.com/index?view=all&sort=old&offset=$rand_offset"
	argstring=$(curl "$url" | grep -o "www\.lesswrong\.com\/posts\/[a-zA-Z0-9_]*\/[a-zA-Z0-9_-]*" | shuf -n 1)
}

#echo ${#sites[@]}
#var=
#echo "RANDOM var: $var"
#echo ${sites[$var]}

if [ "$1" == "-h" ]; then
	usage
	exit 0
elif [ -n "$1" ]; then
	$1
else
	${sites[ $(( RANDOM % ${#sites[@]} )) ]}
fi
"$BROWSER" "$argstring"
