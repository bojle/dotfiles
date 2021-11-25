#!/usr/bin/bash

## Switch b/w teddit.net, old.reddit.com, and reddit.com
site="$(xclip -selection clipboard -o)"

if [[ $site == *"teddit.net"* ]]
then
	site=${site/teddit.net/old.reddit.com}
elif [[ $site == *"old.reddit.com"* ]]
then
	site=${site/old.reddit.com/teddit.net}
elif [[ $site == *"reddit.com"* ]]
then
	site=${site/reddit.com/teddit.net}
else
	printf "Not teddit or old reddit\n"
	exit 1
fi
"$BROWSER" "$site"
