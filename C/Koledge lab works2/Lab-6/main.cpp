#include <iostream>
#include <stdio.h>

int sum(int,int);
float product(float);

int main() {
	int k,l,a;
	float d,c,m;
	printf("input k,l,d\n");
	scanf("%d %d %f", &k, &l, &d);
	m=6*sum(k,l)+5*product(d)*sum(k,l);
	printf("m=%f",m);
	return 0;
}

int sum(int k, int l) {
	int s=0,i;

	for(i=19;i<29; i++)
	s+=2*k*l+i;
	return s;
}

float product(float d){
	float p=1;
	int y;

	for(y=19;y<31;y++)
	p*=y+2*d;
	return p;
}
