#/usr/bin/bash

while (( "$#" > 0 )); do
	img_file_name="$(basename "$1" | cut -d "." -f 1)"
	img_file_exe="$(basename "$1" | cut -d "." -f 2)"
	convert "$1" -threshold 60% tobw_tmp_image
	convert tobw_tmp_image -negate ""$img_file_name"-bw."$img_file_exe""
	shift 1
done
rm tobw_tmp_image

