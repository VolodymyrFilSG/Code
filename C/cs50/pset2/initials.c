#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <ctype.h>


int main(void)
{
	string name = "";
	bool next = true;
	do{
	name = GetString();}
	while (strlen(name) <= 1);

	for (int i = 0; i < strlen(name); ++i)
	{
		if (next == true)
		{
			printf("%c", toupper(name[i]));
			next = false;
		}
		if ((int)name[i] == 32)
		{
			next = true;
		}
	}
	printf("\n");
}
