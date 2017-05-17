#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <ctype.h>


int main(int argc, char const *argv[])
{

	for (int i = 1; i < argc; ++i)
	{
		
		printf("%c", toupper(argv[i][0]));
	}
    string g = GetString();
}
