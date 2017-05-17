#include <stdio.h>

int main() {
	int c[4][5],x[5],z[5],a,i,j,sum=0;
	
	do{
		printf("enter positive number\n");
		scanf("%d",&a);
	}while (a<=0);
	puts("enter mass c");
	for(i=0;i<4;i++)
	 for(j=0;j<5;j++)
	  scanf("%d",&c[i][j]);
	
	
	for(j=0;j<5;j++)
	 for(i=0;i<4;i++){
	 	  sum=sum+c[j][i];
	      z[j]=sum;
	      }
	      
	for(i=0;i<5;i++)
	 if(z[i]*z[i]>a){
	 	   x[i]=z[i];
	       printf("%d\n",x[i]);
    }  
	
	return 0;
}
