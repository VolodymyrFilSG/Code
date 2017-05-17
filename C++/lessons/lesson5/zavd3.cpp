// номери елементів масиву значення яких ділиться націло на x
#include <iostream>
#include <conio.h>

using namespace std;

int main()
{
	const int m = 10;
	const int x = 3;


	int array[m];

	for (int i = 0; i < m; i++){
		cout << "insert array [" << i + 1 << "] postion\t";
		cin >> array[i];
	}
	for (int q = 0; q < m; q++){
        cout << array[q] << " ";

	}
	cout << "\n";
	_getch();

	for (int w = 0; w < m; w++ ){
		if ((array[w] % x) == 0){
			cout << w + 1 << "  ";
		}
	}

	_getch();
	return 0;
}
