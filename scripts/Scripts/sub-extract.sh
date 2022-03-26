#!/usr/bin/sh

## Extract english subtitles from yt videos and format them into a nice text file.

## Syntax
##		sub-extract.sh [url]


url="$1"

# Find Sub-title Language, Look for english
sub_lang=$(youtube-dl --skip-download --list-subs "$url" | grep "en" | tail -n 1 | cut -d " " -f 1)

# Download subtitles to a .vtt file in the current directory
youtube-dl -o "%(title)s.%(ext)s" --skip-download --write-sub --sub-lang "$sub_lang"  "$url"
ls *.vtt

file=$(find ./ -maxdepth 1 -type f -name "*.vtt" -printf "%P\n" | cut -d "[" -f 1 | sed 's/ //g')
ls *.vtt

sed '1,3d; /^[[:space:]]*$/d; /^[0-9]/d' *.vtt > "$file".txt

rm *.vtt
