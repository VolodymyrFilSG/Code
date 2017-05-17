#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

int main() {
	int a,k=0,c=0;
	float y,x;
	printf("input a\n");
	scanf("%d", &a);
	
	for(x=0;x<=19;x+=0.1){
		y=a*x*x+0.5;
		printf("x=%f  y=%f\n", x,y);
		if(y>0)
		k++;
		else
		c++;
	}
	printf(" amount>0=%d\n",k);
	printf(" amount<0=%d\n",c);
	getch();
	return 0;
}
