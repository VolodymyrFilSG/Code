
#include <iostream>
#include <time.h>
#include <stdlib.h>
#include <conio.h>

using namespace std;
int n1, n2, n3, n4, n5, N, sum, kilk, zad;
int main(){
	cout << "insert N\t";
    cin >> N;
    n1 = N / 10000;
    N %= 10000;
    n2 = N / 1000;
    N %= 1000;
    n3 = N / 100;
    N %= 100;
    n4 = N / 10;
    N %= 10;
    n5 = N / 1;
    N %= 1;
    sum = n1 + n2 + n3 + n4 + n5;
    if (n5 != 0){
	    cout << n5 << "\n";
	    kilk++;
	    zad += n5 * 10000;
	}
    if (n4 != 0){
	    cout << n4 << "\n";
	    zad += n4 * 1000;
	    kilk++;
	}
    if (n3 != 0){
	    cout << n3 << "\n";
	    zad += n3 * 100;
	    kilk++;
	}
    if (n2 != 0){
	    cout << n2 << "\n";
	    zad += n2 * 10;
	    kilk++;
	}
    if (n1 != 0){
	    cout << n1 << "\n";
	    zad += n1;
		kilk++;
    }
    cout << "sum\t" << sum << "\nkilk\t" << kilk << "\nzad\t" << zad;
    _getch();
    return 0;
}