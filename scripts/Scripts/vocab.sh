#!/usr/bin/sh
case "$1" in 
	"-p")
		vim $HOME/Notes/other/profound-things.md
		break
		;;
	   *)
		vim $HOME/Notes/other/vocab.md
		break
		;;
esac
