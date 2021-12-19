#!/bin/bash

# Alert if the battery is above or below a threshold

# Used by a systemd service which is governed by a systemd
# timer. This script will be called every `n` minutes. The 
# value of `n` varies.

battery_percent="$(cat /sys/class/power_supply/BAT1/capacity)"
curr_status="$(cat /sys/class/power_supply/BAT1/status)"
beep_file_location="$HOME/.local/share/beep-06.mp3"

function play_beep() {
	local original_volume="$(amixer sget Master | grep -om 1 '[0-9]\+\%')"
	local mute_status="$(amixer sget Master | grep -om 1 '\b\(off\|on\)\b')"
	# Set new volume 
	amixer set Master 85% 
	# Unmute
	amixer set Master toggle on 
	# Play
	mpv "$beep_file_location" 
	# Reset original volume
	amixer set Master "$original_volume" 
	# Reset original mute status
	amixer set Master "$mute_status" 
}

# If X is turned off, exit 
if ! xset q &>/dev/null; then
	exit 1
fi

if [[ "$curr_status" = Discharging ]] && (( battery_percent < 25 )); then
	notify-send --urgency=critical "Low Battery; Connect Charger"
	play_beep
elif [[ "$curr_status" = Charging ]] && (( battery_percent > 80 )); then
	notify-send --urgency=critical "Disconnect Charge"
	play_beep &>/dev/null
fi

exit 0
