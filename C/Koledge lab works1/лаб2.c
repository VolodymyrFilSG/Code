#include <stdio.h>
#define PI 3.14159
/*обчислення площі кулі*/
main(){
    int r, v;
    printf("insert r\n");
    scanf("%df", &r);
    v = 4 * (0.3 * PI * r * r * r);
    printf("V = %d", v);
}
