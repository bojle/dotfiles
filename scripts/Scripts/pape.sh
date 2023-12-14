#!/usr/bin/sh

set -e

bspwmrc_loc="$HOME/.config/bspwm/bspwmrc"
pape_loc="$HOME/Pictures/Wallpapers"

set_new_pape() {
	sed -Ei "s/[0-9]+\.(jpg|png|jpeg)/$1/" $bspwmrc_loc
	bspc wm -r  # Bspwm Restart
}

get_new_file_name() {
  # $1 = old file name
	max=$(( $(find $pape_loc -maxdepth 1 -printf "%P\n" | \
		cut -d . -f 1 | sort -gr | head -n 1) + 1))
	exe=$(basename "$1" | cut -d . -f 2)
  echo "$max.$exe"
}

download_pape() {
	url="$1"
  new_file_name=$(get_new_file_name "$url")
	wget "$url" -O "$pape_loc/$new_file_name"
}

mv_pape() {
  # $1 = file to move
  mv "$1" $pape_loc/"$(get_new_file_name "$1")"
}

print_usage() {
  cat << EOF
pape - simple sorted wallpaper manager 

pape downloads/move images to a fixed wallpapers directory
in a sorted order by numbering them

Usage:
  Download a wallapaper (requires wget)
    pape -d "https://wallpapers.com/wall.png" 
  Move an existing image to the wallpapers directory
    pape -m img.png
  View wallpapers in thumbnail mode (requires sxiv)
    pape -v
  Set a new wallapaper (requires bspwm)
    pape -s 165.png
  Set a random wallpaper
    pape -r
  Change wallapaper directory
    <edit the pape_loc variable in $(whereis pape) script>
EOF
}

case "$1" in
	"-v")
		sxiv -tfr $pape_loc/*
		;;
	"-r")
		set_to=$(ls -1 $pape_loc | shuf -n 1) # Random wallpaper
		set_new_pape "$set_to"
		echo "New Wallpaper: $set_to"
		;;
	"-s")
		if [ -n "$2" ]; then
			set_new_pape "$2"
		fi
		;;
  "-m")
		if [ -n "$2" ]; then
      mv_pape "$2" 
		fi
    ;;
  "-d")
		if [ -n "$2" ]; then
		  download_pape "$2"
		fi
		;;
  *)
    print_usage
    ;;
esac
