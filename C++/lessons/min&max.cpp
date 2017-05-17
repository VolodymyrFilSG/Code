#include "iostream"
#include "conio.h"
#include "math.h"
using namespace std;
float a, b, minn, maxn;
int main()
{
	cout << "insert a, b\n";
	cin >> a >> b;
	minn = (a < b) ? a : b;
	maxn = (a > b) ? a : b;
	cout << "min = " <<  minn << "\n" << "max = " << maxn;

	_getch();
    return 0;
}
