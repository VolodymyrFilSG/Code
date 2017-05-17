#include "iostream"
#include "conio.h"

using namespace std;
float a, b, minn, maxn;
int main()
{
	cout << "insert a, b\n";
	cin >> a >> b;
	minn = (a < b) ? a : b;  // (a ? b : c) - if a == true then b else c
	maxn = (a > b) ? a : b;
	cout << "min = " <<  minn << "\n" << "max = " << maxn;
    return 0;
}
