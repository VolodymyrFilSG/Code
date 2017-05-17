#include <stdio.h>
#include <string.h>

int main() {
	char t[100];
	char*p;
	puts("input text");
	gets(t);
	int amount,i,a=0;
	amount=strlen(t);
	
	for(i=0;i<=amount;i++)
	  if(t[i]=='à')
	   a++;
	
	p=strchr(t,' ');
	strtok(p,"");
	printf("%s\n",p);
	printf("amount=%d\n",amount);
	printf("a=%d",a);
		
	return 0;
}
