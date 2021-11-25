#!/usr/bin/sh
count=1
for file in *
do
	ftype=$(echo "$file" | cut -d . -f 2)
	if [ "$ftype" == "sh" ]; then
		continue;
	elif [ "$ftype" == "jpeg" ]; then
		mv "$file" "$count".jpg
	else
		mv "$file" "$count"."$ftype"
	fi
	((count++))
done

