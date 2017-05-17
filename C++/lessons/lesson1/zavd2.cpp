#include "iostream"
#include "conio.h"

using namespace std;
float a;
float b;
int main()
{
	cout << "insert a\n";
	cin >> a;
    b = a;
    for (int i=0; i <= 10; i++){
       a = a * b;
    }
	cout << a;
	return 0;
}
