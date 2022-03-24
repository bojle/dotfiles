#include <stdio.h>
#include <termios.h>
#include <unistd.h>


int main(int argc, char *argv[]) {
	struct termios t;
	tcgetattr(STDIN_FILENO, &t);
	t.c_lflag &= ~ECHO;
	tcsetattr(STDIN_FILENO, 0, &t);
	printf("SSID: %s\n", argv[1]);
	printf("Password: ");
	char c;
	char arr[64];
	char *p = arr;
	while ((c = getc(stdin)) != '\n') {
		*p = c;
		++p;
	}
	*p = '\0';
	FILE *fp = fopen(".wifi_pass_chr_hstl", "w");
	fprintf(fp, "%s", arr);
	t.c_lflag |= ECHO;
	tcsetattr(STDIN_FILENO, 0, &t);
}
