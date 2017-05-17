#include "iostream"
#include "conio.h"

using namespace std;
int a, z;
int main()
{
	cout << "insert a\n";
	cin >> a;
	z = a % 2;
	cout << z << "\n";
	if (z == 1) { cout << "Neparne"; }
    else { cout << "Parne"; }
	_getch();
	return 0;
}
