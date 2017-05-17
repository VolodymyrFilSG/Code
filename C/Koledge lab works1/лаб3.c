#include <stdio.h>


main() {
    int n1, n2, n3, n4, n5, N, sum, dob;
    printf("insert N\t");
    scanf("%lu", &N);
    n1 = N / 10000;
    N %= 10000;
    n2 = N / 1000;
    N %= 1000;
    n3 = N / 100;
    N %= 100;
    n4 = N / 10;
    N %= 10;
    n5 = N / 1;
    N %= 1;
    sum = n1 + n2 + n3 + n4 + n5;
    dob = n1 * n2 * n3 * n4 * n5;
    printf("sum = %d\n", sum);
    printf("dobutok = %d\n", dob);
    printf("%d %d %d %d %d       %d %d %d        %d %d %d\n", n1, n1, n1, n1, n1, n3, n3, n3, n4, n4, n4);
    printf("%d   %d   %d       %d    %d      %d\n", n1, n1, n1, n3, n3, n5);
    printf("%d %d %d %d %d       %d %d %d       %d\n", n2, n2, n2, n2, n2, n3, n3, n3, n5);
    printf("    %d           %d    %d      %d\n", n2, n3, n3, n5);
    printf("    %d           %d %d %d        %d %d %d\n", n2, n3, n3, n3, n4, n4, n4);
}
