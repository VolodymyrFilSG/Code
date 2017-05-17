
#include <iostream>
#include <fstream>
#include <iomanip>
#include <time.h>
#include <stdlib.h>
#include <conio.h>
using namespace std;
int main(int n)

{
	//F(n-2)
	int x = 1;
	//F(n-1)
	int y = 0;
	//F(n)
	int ans = 0;
	for (int i = 2; i < n; i++)
	{
		ans = x + y;
		x = y;
		y = ans;
		cout << ans <<
	}
	return 0;
}
