#!/usr/bin/sh

usage() {
	cat << END
Usage:
spdf out.pdf merge infiles.pdf
spdf out.pdf split firstpage lastpage infile.pdf
END
}

ofile="$1"
action="$2"
shift 2

if [ "$action" = 'split' ]; then
	firstpage="$1"
	lastpage="$2"
	shift 2
	gs -sDEVICE=pdfwrite -dBATCH -dNOPAUSE -dQUIET -sOutputFile="$ofile"\
		-dFirstPage="$firstpage" -dLastPage="$lastpage" "$@"
elif [ "$action" = 'merge' ]; then
	gs -sDEVICE=pdfwrite -dBATCH -dNOPAUSE -dQUIET -sOutputFile="$ofile"\
		"$@"
else
	usage 
fi
