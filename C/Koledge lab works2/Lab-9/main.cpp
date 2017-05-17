#include <stdio.h>
#include <math.h>

void mas(float *);
int main()
 {
	float r,v;
	printf("input r\n");
	scanf("%f",&r);
	v=4/3*3.14*r*r*r;
	mas(&v);
	printf("mas=%f",v);
	
	return 0;
}
void mas(float *vptr){

	*vptr=19300**vptr;
}
