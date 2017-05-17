// шифр цезаря для CS50
// Філь. В


#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <cs50.h>



int Shipher(char x, int key);

int main(int argc, char const *argv[])
{
	if(argv[1] != NULL)
	{
	int k = atoi(argv[1]);
	string p = GetString();
	if(k > 26){
		k %= 26;
	}
	for (int i = 0; i < strlen(p); ++i)
	{
		printf("%c", Shipher(p[i], k));
	}

	printf("\n");
	}
	else
	{
		printf("insert fucken argv\n");
		return 1;
	}
}


//шифруємо символ
int Shipher(char x, int key)
{
	int c = (int)x;
	//якщо це буква/цифра не шифруємо його
	if(((x >= 48) && (57 >= x)) ||  ((x >= 65) && (90 >= x)) || ((x >= 97) && (122 >= x)))
	{
		if (c >= 97)
		{
		// Маленькі літери
			if((c + key) <= 122){
				c = c + key;
			}
			else
			{
				c = c + key - 26;
			}
		}
		else
		{
		// Великі літери
			if((c + key) <= 90){
				c = c + key;
			}
			else
			{
				c = c + key - 26;
			}
		}
	}
	return c;
}
