#include <stdio.h>
#include <cs50.h>

int main(void)
{
	int counter25 = 0;
	int counter10 = 0;
	int counter5 = 0;
	int counter1 = 0;
	float sum = 0;
	float cents = 0;

while(sum <= 0)
	{
		printf("insert sum\n");
		sum = GetFloat();
	}
/*
cents = sum * 100;
if (sum == "4.2"){
	printf("18\n");
} else {*/
cents = (int)((sum + 0.0001)*100);

while (cents > 0){
		if(cents >= 25){
			cents = cents - 25;
			counter25 = counter25 + 1;
		} else {
		break;
	}
}
while (cents > 0){
		if(cents >= 10){
			cents = cents - 10;
			counter10 = counter10 + 1;
		} else {
		break;
	}
}
while (cents > 0){
		if(cents >= 5){
			cents = cents - 5;
			counter5 = counter5 + 1;
		} else {
		break;
	}
}

while (cents > 0){
		if(cents >= 1){
			cents = cents - 1;
			counter1 = counter1 + 1;
		} else {
		break;
	}
}
printf("%d\n", counter25 + counter10 + counter5 + counter1);
/*printf("your 0.25 coins = %d\n", counter25);
printf("your 0.1 coins = %d\n", counter10);
printf("your 0.05 coins = %d\n", counter5);
printf("your 0.01 coins = %d\n", counter1);*/
}
//}