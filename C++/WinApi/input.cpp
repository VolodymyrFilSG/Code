/*
�������� ����� � ���������
*/


#include <iostream>
#include <conio.h>
#include <stdlib.h>
#include <stdio.h>

using std::cout;
using std::endl;
using std::cin;

int main()
{
    setlocale(LC_ALL, "Russian");
    cout << ~(unsigned long long) 0 << "\n";
    const int Size = 1024;
    const int Siz = 8;

    unsigned long long Tera;
    unsigned long long Giga;
    unsigned long long Mega;
    unsigned long long Kilo;
    unsigned long long Byte;
    unsigned long long Bit;

    cout << "����i�� �i���i��� ��������i� ";
    cin >> Tera;

    Giga = (unsigned long long)Tera * (unsigned long long)Size;
    Mega = (unsigned long long)Giga * (unsigned long long)Size;
    Kilo = (unsigned long long)Mega * (unsigned long long)Size;
    Byte = (unsigned long long)Kilo * (unsigned long long)Size;
    Bit  = (unsigned long long)Byte * 8;

    cout << "��������i�\t = \t" << Tera << "\n";
    cout << "�i������i�\t = \t" << Giga << "\n";
    cout << "��������i�\t = \t" << Mega << "\n";
    cout << "�i������i�\t = \t" << Kilo << "\n";
    cout << "����i�\t\t = \t" << Byte << "\n";
    cout << "�i�i�\t\t = \t" << Bit << "\n";
    _getch();

    return 0;
}
