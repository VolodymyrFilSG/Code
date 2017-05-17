// знаходження середнього арифметичного елементыв масиву
#include <iostream>
#include <conio.h>

using namespace std;

int main()
{
	const int m = 10;
	float sum = 0;
	float arithmetic;
	int array[m];

	for (int i = 0; i < m; i++){
		cout << "insert array [" << i + 1 << "] postion\t";
		cin >> array[i];
	}
	for (int q = 0; q < m; q++){
        cout << array[q] << " ";
        sum += array[q];

	}
	_getch();

	cout << "\n" << sum;
	arithmetic = sum / 10;

	cout << "\n arithmetic of array = " << arithmetic;
	_getch();
	return 0;
}
