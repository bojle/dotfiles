#! /usr/bin/sh
var=""
rightcount=0
wrongcount=0
while read var
do
	if [ "$var" == "$1" ]
	then
		echo correct
		((++rightcount))
	else
		echo incorrect
		((++wrongcount))
	fi
done
echo -n "The score is: "
expr $rightcount - $wrongcount
