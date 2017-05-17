// program generates random numbers  or 2 and prints frequency
#include <iostream>
#include <fstream>
#include <iomanip>
#include <time.h>
#include <stdlib.h>
#include <conio.h>
using namespace std;
int func(){
	setlocale (LC_ALL, "RUS");
	ofstream f;
	f.open("D:\\rand.txt", ios::app);
	int frequency[2] = {0,0};

	for (int i=0; i<10000000; i++){
	    srand( time( NULL ) );
	    int m = rand()%2;
	    ++frequency[m];
	    }
	
	cout << frequency[0] << "\t" << frequency[1] <<"\n";
	f << frequency[0] << "\t" << frequency[1] <<"\n";
	f.close();
	return 0;
}


int main(){
	for (int j = 0; j<1000; j++){
	    func();
	    cout << j <<"\n";
	}
	return 0;
}