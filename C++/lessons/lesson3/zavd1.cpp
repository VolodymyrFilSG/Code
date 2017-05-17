
#include <iostream>
#include <time.h>
#include <stdlib.h>
#include <conio.h>

using namespace std;
int a, b, sum;
int main(){
	int i = 0;
	cout << "insert a < b\n";
	cin >> a >> b;
	sum = a;
	while(a++ <= b)
		{
			sum += a;
		}
	cout << "Sum = " << sum;
	_getch();
	return 0;
}
