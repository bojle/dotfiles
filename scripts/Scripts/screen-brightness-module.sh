#!/bin/bash
current=$( cat /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
result=$( bc <<< "scale=3; ($current / $max ) * 100")
echo "$result"
