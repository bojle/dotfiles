#!/bin/bash

rc_dir="$HOME/.config/mutt"
selection="$(cat $HOME/.config/mutt/emails | rofi -font "JetBrains Mono 12" -dmenu)"
alacritty -e neomutt -F $rc_dir/"neomuttrc.$selection"
