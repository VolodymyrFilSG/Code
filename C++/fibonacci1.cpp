#include <iostream>
#include <fstream>
#include <iomanip>
#include <time.h>
#include <stdlib.h>
#include <conio.h>
using namespace std;
int main(){
	setlocale (LC_ALL, "RUS");
	ofstream f;
	f.open("D:\\fibonacci1.txt", ios::app);
	unsigned long long a = 0;
	unsigned long long b = 1;
	unsigned long long c = 0;
	for (int i=0; i<100; i++){
    a = b+c;
	c = b;
	b = a;
	f << a <<"\n";
    }
	f.close();
	return 0;
}
