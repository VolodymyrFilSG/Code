// сума непарних елементів масиву і кількість нульових значень
#include <iostream>
#include <conio.h>

using namespace std;

int main()
{
	const int m = 10;
	float sum = 0;
	int zeros = 0;

	int array[m];

	for (int i = 0; i < m; i++){
		cout << "insert array [" << i + 1 << "] postion\t";
		cin >> array[i];
	}
	for (int q = 0; q < m; q++){
        cout << array[q] << " ";
        if (array[q] == 0){
        	zeros++;
        }
	}
	_getch();

	for (int w = 0; w < m; w += 2){
		sum += array[w];
	}

	cout << "\n sum = " << sum << "\n number of zeros " << zeros;
	_getch();
	return 0;
}
