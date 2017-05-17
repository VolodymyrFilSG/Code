#include <stdio.h>
#include <stdlib.h>

int main() {
	int f,a,Ns,Sp,Sv;
	f = 42*(2+8*27);
	printf("Vvedit' typ robit (1,2,3): \n");
	scanf("%d",&a);
	if (a==1){
		Ns = 50*(f+100);
		Sp = (Ns*10)/100;
		Sv = Ns-Sp;
	printf("Ns=%d \n", Ns);
	printf("Sp=%d \n", Sp);
	printf("Sv=%d \n", Sv);
	printf("Ns-narahovana suma; Sp-cuma podatku; Sv-cuma do vudachi.");
}
	else
	if (a==2){
		Ns = 100*(f+120);
		Sp = (Ns*15)/100;
		Sv = Ns-Sp;
	printf("Ns=%d \n", Ns);
	printf("Sp=%d \n", Sp);
	printf("Sv=%d \n", Sv);
	printf("Ns-narahovana suma; Sp-cuma podatku; Sv-cuma do vudachi.");
}
	else
	if (a==3){
		Ns = 155*(f+180);
		Sp = (Ns*20)/100;
		Sv = Ns-Sp;
	printf("Ns=%d \n", Ns);
	printf("Sp=%d \n", Sp);
	printf("Sv=%d \n", Sv);
	printf("Ns-narahovana suma; Sp-cuma podatku; Sv-cuma do vudachi.");
}
	else{
	printf("Pomylka");
	}	
return 0;
}

