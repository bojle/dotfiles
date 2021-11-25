#!/usr/bin/sh

curl -s "https://moby-thesaurus.org/$1" | grep -Po "(?<=search\?q=)[a-zA-Z -]+"


