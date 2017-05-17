

#include <iostream>
#include <time.h>
#include <stdlib.h>
#include <conio.h>

using namespace std;
int a, fact;

int main(){
int i = 1;
fact = 1;
srand( time( NULL ) );

cout<< "insert a ";
cin >> a;
while (i++ <= a)
	fact = fact * i;
cout << "fact (a) = " << fact;
}
