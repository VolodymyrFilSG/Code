#include <stdio.h>      /* printf */
#include <stdlib.h>     /* strtol */


void to_bin(int x, char ret[9]) {
	int bit = 1;
	for (int i = 7; i >= 0; --i) {
		ret[i] = (x & bit) ? '1' : '0';
		bit <<= 1;
	}
	ret[8] = '\0';
}

int main(int argc, char const *argv[])
{
	char *arr = malloc(sizeof(char) * 8);
	to_bin(atoi(argv[1]), arr);
	printf("%s\n", arr);
	return 0;
}
