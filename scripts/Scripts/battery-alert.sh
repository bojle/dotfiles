#!/bin/bash

# Alert if the battery is above or below a threshold

# Used by a systemd service which is governed by a systemd
# timer. This script will be called every `n` minutes. 

# Pauses notfications and sound alerts
dnd_mode=0

battery_percent="$(cat /sys/class/power_supply/BAT1/capacity)"
curr_status="$(cat /sys/class/power_supply/BAT1/status)"

# beep_file_location="$HOME/.local/share/beep-06.mp3"

function play_beep() {
	local original_volume="$(amixer sget Master | grep -om 1 '[0-9]\+\%')"
	local mute_status="$(amixer sget Master | grep -om 1 '\b\(off\|on\)\b')"
	local is_connected=$(bluetoothctl info | grep -i "connected" | cut -d" " -f 2)
	if ! [ "$is_connected" = "yes" ]; then
		# Set new volume 
		amixer set Master 70% 
		# Unmute
		amixer set Master toggle on 
	fi
	# Play a 800Hz sine for 0.5 seconds (speaker-test comes with alsa)
	if [ $dnd_mode == 0 ]; then
		speaker-test -t sine -f 800 -l 1 & sleep 0.5 && kill -9 $!
	fi
	# mpv "$beep_file_location" 
	if ! [ "$is_connected" = "yes" ]; then
		# Reset original volume
		amixer set Master "$original_volume" 
		# Reset original mute status
		amixer set Master "$mute_status" 
	fi
}

# If X is turned off, exit 
if ! xset q &>/dev/null; then
	exit 1
fi

notification_string=""
if [[ "$curr_status" = Discharging ]] && (( battery_percent < 21 )); then
	notification_string="Low Battery; Connect Charger"
elif [[ "$curr_status" = Charging ]] && (( battery_percent > 79 )); then
	notification_string="Disconnect Charge"
fi

if [ $dnd_mode == 0 ]; then
	notify-send --urgency=critical "$notification_string"
	#play_beep &>/dev/null
fi

exit 0
