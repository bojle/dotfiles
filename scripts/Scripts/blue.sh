#! /usr/bin/sh

POWER=$(bluetoothctl show | grep -i "powered" | cut -d" " -f 2)
DISCOV=$(bluetoothctl show | grep -i "discoverable:" | cut -d" " -f 2)
#MAC="90:7A:58:2d:51:76" # wi c200 (retired)
MAC="48:D8:45:DC:9C:86" # Nord Buds 2

switch_on()
{
	bluetoothctl power on
	bluetoothctl discoverable on
	bluetoothctl connect "$MAC"
}

switch_off() {
	bluetoothctl disconnect "$MAC"
}

is_connected=$(bluetoothctl info | grep -i "connected" | cut -d" " -f 2)
if [ "$is_connected" = "yes" ] 
then 
	switch_off
else
	switch_on
fi
