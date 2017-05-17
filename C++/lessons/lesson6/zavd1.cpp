#include <iostream>
#include <conio.h>
#include <time.h>
#include <random>

using namespace std;



int a = 100;
int b = -100;
int sum = 0;
int counter = 0;


int main()
{
	const int m = 10;


	int array[m];
	srand( time( NULL ) );

	for (int i = 0; i < m; i++){
		array[i] = rand() % abs(a - b) + std::min(a, b);
	}

	for (int q = 0; q < m; q++){
        cout << array[q] << " ";
        sum += array[q];
	}

	_getch();

	/////////////////////////////////////////////////////////////////////////////////////////////////////

	int arithmetic = sum / m;
	cout << "\nArithmetic mean = " << arithmetic;
	_getch();

	/////////////////////////////////////////////////////////////////////////////////////////////////////

	int first_minus, last_minus, count = 0;

	for (int w = 0; w < m; w++){
		if (array[w] < 0){
			first_minus = w;
			break;
		}
	}
	for (int e = m; e > first_minus; e--){
		if (array[e] < 0){
			last_minus = e+1;
			break;
		}
	}
	cout << "\nBetween first and last_minus " << last_minus - first_minus - 2;
	_getch();

	//////////////////////////////////////////////////////////////////////////////////////////////////////

	int counter_one_number = 0;
	int counter_two_number = 0;
	int one_number_percent = 0;
	int two_number_percent = 0;

	for (int t = 0; t < m; t++){
		if (array[t] >= 10 || array[t] <= -10){
			counter_two_number++;
		}else{
			counter_one_number++;
		}
	}
	cout << "\nOne number percent = "<< (counter_one_number * 100) / m << "% Two number percent = " << (counter_two_number * 100) / 10 << "%";
	_getch();

	///////////////////////////////////////////////////////////////////////////////////////////////////////



	return 0;
}

