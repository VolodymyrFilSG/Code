
#include <math.h>
#include <stdio.h>
#include <stdlib.h> //for glory
#include <time.h>

float p(double);

int main() {
	double f,a,x,y,z,d,o;
	time_t s,fin;
	s=time(0);
	a=3.28;
	x=3.14;
	y=7.28;
	z=3.94;
	scanf("%lf",&o);
	f=pow((p(x)+p(z)*x-p(y)),1/3);
	
	printf("f=%d",f);
	fin=time(0);
	d=difftime(fin,s);
	printf("\ntime=%f",d);

	return 0;
}

float p(double g){
	
	return tan(3.18*g)+sin(g);
		
}
