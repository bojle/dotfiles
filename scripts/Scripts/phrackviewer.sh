#!/usr/bin/sh
DIR=$HOME/docs/textphilez/phrack

viewer() {
	printf "Issue No: %d\n" $1
	cd ${DIR}/Issue$1/
	ls | sort -n | xargs less
}

if [ "$#" -gt 0 ]
then
	viewer $1
else
	RANDOISSUE=$[ $RANDOM % 69 + 1 ]
	viewer ${RANDOISSUE}
fi
