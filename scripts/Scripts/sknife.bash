#!/bin/bash

# syntax: sknife convert -o hello.jpg
# convert: -t -f -o 
# compress 


inputfiles=()
outputfiles=""
firstpage=""
lastpage=""

usage() {
	cat << END
Usage: sknife [procedure] [infile] [firstpage] [lastpage] [-o outfile]
sknife convert a.png b.jpg c.png -o out.pdf f.png
sknife compress a.pdf -o out.pdf
sknife split a.pdf 1 2 -o out.pdf
sknife merge e.pdf a.pdf -o merged.pdf  b.pdf
END
}

### PDF ### 

pdftotxt() {
	gs -sDEVICE=txtwrite -sOutputFile="$outputfiles" -q -dNOPAUSE -dBATCH "${inputfiles[@]}"
}

pdftopng() {
	local basenem="$(basename "$outputfiles" | cut -d . -f 1)"
	local exe="$(basename "$outputfiles" | cut -d . -f 2)"	
	gs -dNOPAUSE -dBATCH -q -sDEVICE=pngalpha -o "$basenem"-%03d."$exe" -r144 "${inputfiles[@]}"
}
alias pdftojpg='pdftopng'

pdftops() {
	pdf2ps "${inputfiles[@]}" "$outputfiles"
}

pdfsplit() {
	gs -sDEVICE=pdfwrite -dBATCH -dNOPAUSE -dQUIET -sOutputFile="$outputfiles"\
				-dFirstPage="$firstpage" -dLastPage="$lastpage" "${inputfiles[@]}"
}
pdfmerge() {
	gs -sDEVICE=pdfwrite -dBATCH -dNOPAUSE -dQUIET -sOutputFile="$outputfiles"\
		"${inputfiles[@]}"
}
pdfcompress() {
	gs -sDEVICE=pdfwrite -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH \
		-sOutputFile="$outputfiles" "${inputfiles[@]}"
}
###

### Image ###
alias jpgtopdf='pngtopdf'
alias jpgtodoc='pngtodoc'
alias jpgcompress='pngcompress'
pngtopdf() {
	img2pdf "${inputfiles[@]}" -o "$outputfiles"
}

pngtodoc() { 
	# Not docbook. Normal black/white pdf that sort-of resembles a scanned document.
	convert "${inputfiles[@]}" -threshold 60% __tmpbw.jpg # creates __tmpbw-0.jpg __tmpbw-1.jpg ...
	img2pdf __tmpbw-*.jpg -o "$outputfiles"
	rm __tmpbw-*.jpg
}

pngcompress() {
	convert "${inputfiles[@]}" \
		-sampling-factor 4:2:0 -strip -interlace Plane  \
		-quality 45% -colorspace RGB  "$outputfiles"
}

###

### Audio/Video

mp3merge() {
	tmp="concat.txt"
	rm "$tmp" 2>/dev/null
	echo "ffconcat version 1.0" >> "$tmp"
	for i in "${inputfiles[@]}"; do
		echo "file '"$i"'" >> "$tmp"
	done
	ffmpeg -f concat -safe 0 -i "$tmp" -c copy "$outputfiles"
	rm "$tmp"
}
alias m4bmerge='mp3merge'
alias avimerge='mp3merge'

###


filextension() {
	basename "$1" | cut -d "." -f 2
}

main() {
	if [[ "$1" == "-h" ]]; then
		usage
		exit 0
	fi

	local procedure="$1"
	shift 1

	while (( $# > 0 ))
	do
		if [[ $1 == "-o" ]]; then
			outputfiles="$2"
			shift 2
		elif [[ $1 =~ ^[0-9]+$ ]]; then
			firstpage="$1"
			lastpage="$2"
			shift 2
		else
			inputfiles+=("$1")
			shift 1
		fi
	done

	local infiletype="$(filextension "${inputfiles[0]}")"
	local outfiletype="$(filextension "${outputfiles}")"

	case "$procedure" in
		"convert")
			eval "$infiletype"to"$outfiletype"
			;;
		*)
			eval "$infiletype""$procedure"
			;;
	esac

	#echo ${inputfiles[@]}
	#echo $outputfiles
	#echo $firstpage
	#echo $lastpage
}

main "$@"
