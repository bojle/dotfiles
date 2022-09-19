#!/bin/bash

rc_dir="$HOME/.config/mutt"
selection="$(cat $HOME/.config/mutt/emails | rofi -font "JetBrains Mono 12" -dmenu)"
neomutt -F $rc_dir/"neomuttrc.$selection"
