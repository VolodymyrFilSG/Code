#include <iostream>
#include <conio.h>
#include <time.h>
#include <random>

using namespace std;



int a = 10;
int b = 99;
int sum = 0;
int counter = 0;
const int m = 5;

int main()
{
	int array[m][m];
	srand( time( NULL ) );

	for (int i = 0; i < m; i++){
		for (int j = 0; j < m; j++){
			array[i][j] = rand() % abs(a - b) + std::min(a, b);
		}
	}

	for (int q = 0; q < m; q++){
        for (int w = 0; w < m; w++){
        	cout << array[q][w] << " ";
        sum += array[q][w];
    	}
    	cout << "\n";
	}

	_getch();

	/////////////////////////////////////////////////////////////////////////////////////////////////////

	int arithmetic = sum / (m * m);
	cout << "\nArithmetic mean = " << arithmetic << "\n";
	_getch();

	/////////////////////////////////////////////////////////////////////////////////////////////////////

	int max_sum_column = 0;
	int sum_column = 0;

	for (int z = 0; z < m; z++){
		for (int x = 0; x < m; x++){
			sum_column += array[x][z];
		}

		max_sum_column = (sum_column > max_sum_column) ? sum_column : max_sum_column;
		sum_column = 0;
	}
	cout << "\nmaximum sum for column = " << max_sum_column << "\n";
	_getch();

	///////////////////////////////////////////////////////////////////////////////////////////////////// циклический сдвиг строк вниз

	/*int prom[m] = {0};
	int newarray[m][m] = {0};
	for (int c = 0; c < m; c++){
		prom[c] = array[5][c];
	}
	for (int v = m; v >= 1; v--){
		for (int b = 0; b < m; b++){
			newarray[v][b] = array[v - 1][b];
		}
	}

	for (int p = 0; p < m; p++){
		newarray[0][p] = prom[p];
	}

	for (int n = 0; n < m; n++){
        for (int a = 0; a < m; a++){
        	cout << newarray[n][a] << " ";
    	}
    	cout << "\n";
	}
	_getch();*/


	cout << "\n";
    for (int n = 0; n < m; n++){
        cout << array[4][n] << " ";
    }
    cout << "\n";
	for (int v = 0; v < (m - 1); v++){
		for (int b = 0; b < m; b++){
			cout << array[v][b] << " ";
		}
		cout<< "\n";
	}
	_getch();

	//////////////////////////////////////////////////////////////////////////////////////////////////////циклический сдвиг столбцов влево

    cout << "\n";
	for (int i = 0; i < m; i++){
		for (int j = 1; j < m; j++){
			cout << array[i][j] << " ";
        }
		cout << array [i][0] << "\n";
	}
	_getch();
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////

	return 0;
}

