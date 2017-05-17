#include <stdio.h>
#include <cs50.h>

int main(void)
{

int height = -1;
while(!(height >= 0 && 23 >= height))
{
printf("insert height\n");
height = GetInt();
}

int counter = 0;
for (int i = 0; i < height; i++){
	counter++;
	for (int x = 0; x < height - counter; x++)
	    {
	    printf(" ");
	    }
	for (int j = 0; j < counter + 1; j++)
		{
		printf("#");
		}
		printf("\n");
	}
}
