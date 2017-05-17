// Vigener for CS50 cource
// Volodymyr Fil


#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/////////////////////////////////////////////////////////////////
int cipher(char x, int key);


int main(int argc, char const *argv[])
{
	if(argc == 2)
	{
		//checking if a key is valid (have none numeric or other non-letter symbols)

		for (int i = 0; i < strlen(argv[1]); ++i)
		{
			if (!isalpha(argv[1][i]))
			{
				printf("Your keyword is invalid\n");
				return 1;
			}
		}

		// getting a word
		string word = GetString();

		// counter is needed to correct selection of letter
		// missing non chiphering symbols
		int counter = 0;
		for (int i = 0; i < strlen(word); ++i)
		{
			if (isalpha(word[i]))
			{
				// key value for caesar sh
				int z = counter % strlen(argv[1]);

				int key = tolower(argv[1][z]) - 97;

				printf("%c", cipher(word[i], key));

				++counter;
			}
			else
			{
				printf("%c", word[i]);
			}
		}
			printf("\n");
	}
	else
	{
		printf("You've forgotten to add keyword as parameter\n");
		return 1;
	}
}




// gets char and key, converts char to int(based on ASCII table)
// adding key, converts back to char and returns that.
// caesar cipher

int cipher(char x, int key)
{
	int asc = (int)x;
	if (isupper(x))
	{
		asc = asc + key;
		if (asc > 90)
		{
			asc = asc - 26;
		}
	}
	else
	{
		asc = asc + key;
		if (asc > 122)
		{
			asc = asc - 26;
		}
	}

	return asc;
}
