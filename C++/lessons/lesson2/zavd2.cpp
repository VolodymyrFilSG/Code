#include "iostream"
#include "conio.h"

using namespace std;
int a, z;
int main()
{
	cout << "insert a\n";
	cin >> a;

	while (a > 9){
		a = a - 10;
		++z;
	}
    if (z != 0) cout << z << "  " << a;
    else cout << a;
	_getch();
	return 0;
}
