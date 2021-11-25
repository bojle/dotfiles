#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	if (argv[1][0] == '-' && argv[1][1] == 'h') {
		fprintf(stdout, "Convert [number] of [base] to Integer\n"
						"Usage: toint [number] [base]\n");
		return 0;
	}
	if (argc < 3) {
		fprintf(stderr, "Too few arguments\nUsage: toint [number] [base]\n");
		return 1;
	}
	printf("%ld\n", strtol(argv[1], NULL, strtol(argv[2], NULL, 10)));
	return 0;
}
