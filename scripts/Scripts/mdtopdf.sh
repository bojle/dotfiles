#!/usr/bin/sh 

pdfviewer="zathura"
dir=""
filename=""
infiles=()

makepdf(){ 
	outfile="$1"
	shift 1
	pandoc -t html --css ~/Scripts/css/nulatex.css --quiet -o "$outfile" "$infiles"
	"$pdfviewer" "$outfile"
}


while [ "$#" -gt 0 ]; do
	case "$1" in 
		"-d")
			dir="/tmp/"
			shift 1
			;;
		"-n")
			pdfviewer=":"
			shift 1
			;;
		*)
			filename=""$(basename "$1" | cut -d . -f 1)"".pdf""
			infiles="$@"
			shift 1
			;;
	esac
	
done

# Pass the file through m4 if needed.
if grep -m 1 -qF "m4_include" "$infiles"; then
	m4 -P "$infiles" > /tmp/m4_temp_buffer
	infiles="/tmp/m4_temp_buffer"
fi

makepdf "$dir$filename" 
