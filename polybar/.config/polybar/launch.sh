#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

external_monitor_connected="$(xrandr -q | grep 'HDMI-1-0')"
if [[ $external_monitor_connected = *connected* ]]; then
    polybar -c ~/.config/polybar/config.ini main_external &
fi
# Launch bar1 and bar2
polybar -c ~/.config/polybar/config.ini main &
