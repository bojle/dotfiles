#!/usr/bin/awk -f

# Convert USD to INR

BEGIN {
	val = int(ARGV[1])
	# Current value
	val *= 75
	size = split(val, arr, "")
	start = (size % 2 == 0) ? 2 : 3 
	# Print $val comma separated
	for (i = 1; i <= size; ++i ) {
		if (size > 4  && i != size && i == start) {
			printf(",")
			start += 2
		}
		printf("%d", arr[i])
	}
	printf("\n")
}
