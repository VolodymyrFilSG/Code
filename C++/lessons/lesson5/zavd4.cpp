
#include <iostream>
#include <conio.h>

using namespace std;

int main()
{
	const int m = 10;

	int array[m];
	int result_array[m] = {0};

	for (int i = 0; i < m; i++){
		cout << "insert array [" << i + 1 << "] postion\t";
		cin >> array[i];
	}
	for (int q = 0; q < m; q++){
        cout << array[q] << " ";
	}
    int b = m;
	for (int j = -1; b >= 0; b--, j++){
		result_array[b] = array[j];

	}

	cout << "\n";

	for (int w = 0; w < m; w++){
        cout << result_array[w] << " ";
	}
	_getch();
	return 0;
}
