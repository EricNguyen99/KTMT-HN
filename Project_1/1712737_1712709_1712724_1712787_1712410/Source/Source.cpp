#include "ThuVien.h"

void main(int iSoThSo, char* mangThSo[])
{
	if (iSoThSo < 4)
	{
		cout << "\nNhap khong dung cu phap!";
		return;
	}

	int thuatToan = atoi(mangThSo[1]);
	string FileIn = mangThSo[2];
	string FileOut = mangThSo[3];
	if (thuatToan == 1)
	{
		Run(FileIn, FileOut);
	}
	else
	{
		Run2(FileIn, FileOut);
	}

	
	system("pause");
}