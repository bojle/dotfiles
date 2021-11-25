#!/usr/bin/sh

cat $HOME/.quicklinks | rofi -font "JetBrains Mono 12" -dmenu | xclip -selection clipboard -i
