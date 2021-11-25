#!/bin/sh

seconds=1200
# Make a comma separated string where field 3 => pid and field 4 => cmdname
cmdstring=$( ps -ax -o pid,cmd | grep "sleep $seconds" | head -n 1 | sed 's/  \| /,/g')

cmdname="$(printf "$cmdstring" | cut -d, -f 4)"
pid="$(printf "$cmdstring" | cut -d, -f 3)"

printf "cmdstring: %s\n" $cmdstring
printf "cmdname: %s\n" $cmdname
printf "pid: %d\n" $pid 

start_timer() {
	notify-send -t 1200 "Timer started for $[ $1 / 60 ] minutes"
	sleep $1
	notify-send -i $HOME/Pictures/Meme/very-relaxed-pepe.jpg "Take a Break"
}

end_timer() {
	kill -s 9 "$1"
}

if [ "$cmdname" = "grep" ] # Implies timer is inactive
then
	printf "Starting...\n"
	start_timer $seconds
else
	printf "Ending...\n"
	end_timer $pid
fi
