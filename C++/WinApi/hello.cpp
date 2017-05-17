// program finds all windows and switches their labels
//

#include <windows.h>
using namespace std;

BOOL CALLBACK childProc(HWND h, LPARAM l){
	if(h) {
		SendMessageA(h, WM_SETTEXT, 0, (LPARAM)"Hello world!");
		SetWindowTextA(h, "Hello world!");
	}
	return true;
}

BOOL CALLBACK enumProc(HWND h, LPARAM l){
	SetWindowTextA(h, "Hello world!");
	SendMessageA(h, WM_SETTEXT, 0, (LPARAM)"Hello world!");
	EnumChildWindows(h, childProc, 0);
	return true;
}

static UINT i;

int main(int argc, char* argv[])
{

	while(10)
		EnumWindows(enumProc, 0);

	return 0;
}

