#!/usr/bin/sh

bspwmrc_loc="$HOME/.config/bspwm/bspwmrc"
pape_loc="$HOME/Pictures/Wallpapers/"

set_new_pape() {
	sed -Ei "s/[0-9]+\.(jpg|png|jpeg)/$1/" $bspwmrc_loc
	bspc wm -r  # Bspwm Restart
}

download_pape() {
	max=$(( $(find $pape_loc -maxdepth 1 -printf "%P\n" | \
		cut -d . -f 1 | sort -gr | head -n 1) + 1))
	url="$1"
	exe=$(basename "$url" | cut -d . -f 2)
	wget "$url" -O "$HOME/Pictures/Wallpapers/$max.$exe"
}


case "$1" in
	"-v")
		sxiv -tfr $pape_loc/*
		;;
	"-r")
		set_to=$(ls $pape_loc | shuf -n 1) # Random wallpaper
		set_new_pape "$set_to"
		echo "New Wallpaper: $set_to"
		;;
	"-s")
		if [ -n "$2" ]; then
			set_new_pape "$2"
		fi
		;;
	*)
		download_pape "$1"
		;;
esac
