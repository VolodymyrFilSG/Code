#include <stdio.h>
#include <string.h>
#include <cs50.h>

int main(int argc, char const *argv[])
{
	if(isalpha(argv[0])){
		printf("alpha\n");
	}
	printf("%d\n", strlen(argv[1]));
}