#include "ThuVien.h"
//==============================QINT===================================
string DevideByTwo(string s, bool &sodu)
{
	string thuong;
	char *temp = new char[100];
	int soDuTemp = 0;
	int i;
	for (i = 0; i < s.length(); i++)
	{
		if (soDuTemp != 0)
		{
			int tempThuong = (int(s[i] - 48) + (soDuTemp * 10)) / 2;
			temp[i] = char(tempThuong + 48);
			soDuTemp = (int(s[i] - 48) + (soDuTemp * 10)) - tempThuong * 2;
		}
		else
		{
			int tempThuong = int(s[i] - 48) / 2;
			temp[i] = char(tempThuong + 48);
			soDuTemp = int(s[i] - 48) - tempThuong * 2;
		}
	}
	temp[i] = NULL;
	thuong = temp;

	if (s[s.length() - 1] == '1' || s[s.length() - 1] == '3' || s[s.length() - 1] == '5'
		|| s[s.length() - 1] == '7' || s[s.length() - 1] == '9')
	{
		sodu = 1;
	}
	else
	{
		sodu = 0;
	}

	if (thuong.length() != 1)
	{
		while (thuong[0] == '0')
		{

			thuong.erase(thuong.begin());
		}
	}
	return thuong;
}
bitset<128> ConvertToBinary(string sTemp)
{
	bitset<128> kq;
	bool sodu;
	int i, j, k;

	string thuong = DevideByTwo(sTemp, sodu);
	char *sBinary = new char[100];

	if (sTemp[sTemp.length() - 1] == '1' || sTemp[sTemp.length() - 1] == '3' || sTemp[sTemp.length() - 1] == '5'
		|| sTemp[sTemp.length() - 1] == '7' || sTemp[sTemp.length() - 1] == '9')
	{
		kq[0] = 1;
	}
	else
	{
		kq[0] = 0;
	}

	for (i = 1; thuong != "0"; i++)
	{
		thuong = DevideByTwo(thuong, sodu);
		kq[i] = sodu;
	}

	bitset<128> temp;
	for (i = 0, j = 127; i < 128, j >= 0; i++, j--)
	{
		temp[i] = kq[j];

	}
	return temp;
}
bitset<128> PlusOne(bitset<128> bu1)
{
	bitset<128> mangBu2; //Lưu kết quả trả về
	bool nho, kq;

	// Điền bit phải cùng
	if (bu1[127] == 1)
	{
		nho = 1;
		mangBu2[127] = 0;
	}
	else
	{
		nho = 0;
		mangBu2[127] = 1;
	}

	//Đi từ bit kế cuối từ phải qua trái vì đã xét bit cuối ở trên
	for (int i = 126; i >= 0; i--)
	{
		if (bu1[i] == 1 && nho == 1)
		{
			kq = 0;
			nho = 1;
		}
		else if ((bu1[i] == 0 && nho == 1) || (bu1[i] == 1 && nho == 0))
		{
			kq = 1;
			nho = 0;
		}
		else
		{
			kq = 0;
			nho = 0;
		}
		mangBu2[i] = kq;
	}
	return mangBu2;
}

string AddString(string x, string y)
{
	//Đưa chuỗi về cùng độ dài	
	if (x.length() > y.length())
	{
		int hieu = x.length() - y.length();
		for (int i = 1; i <= hieu; i++)
		{
			y = "0" + y;
		}
	}
	else if (x.length() < y.length())
	{
		int hieu = y.length() - x.length();
		for (int i = 1; i <= hieu; i++)
		{
			x = "0" + x;
		}
	}

	//cout << endl << x.length() << endl << y.length() << endl;

	//Thực hiện cộng
	int nho = 0, dem = 0;
	char *ketqua = new char[x.length() + 1];
	char kq;

	for (int i = x.length() - 1; i >= 0; i--)
	{
		int temp = int(x[i] - 48) + int(y[i] - 48);
		if (temp >= 10)
		{
			kq = char(((temp + nho) % 10) + 48);
			nho = temp / 10;
		}
		else
		{
			kq = char(((temp + nho) % 10) + 48);
			if (temp + nho == 10)
			{
				nho = 1;
			}
			else
			{
				nho = 0;
			}
		}
		ketqua[dem] = kq;
		dem++;
	}

	if (nho != 0)
	{
		ketqua[dem] = char(nho + 48);
		ketqua[dem + 1] = NULL;
	}
	else
	{
		ketqua[dem] = NULL;
	}
	string temp = ketqua;
	return _strrev((char*)temp.c_str());
}
string MultipTwo(string s)
{
	string ketqua;
	char *mangKetQua = new char[s.length() + 1];
	int nho = 0;
	int dem = 0;
	char kq;
	for (int i = s.length() - 1; i >= 0; i--)
	{
		int temp = int(s[i] - 48) * 2;

		if (temp >= 10)
		{
			kq = char(((temp + nho) % 10) + 48);
			nho = temp / 10;
		}
		else
		{
			kq = char(((temp + nho) % 10) + 48);
			nho = 0;
		}
		mangKetQua[dem] = kq;
		dem++;
	}

	if (nho != 0)
	{
		mangKetQua[dem] = char(nho + 48);
		mangKetQua[dem + 1] = NULL;
	}
	else
	{
		mangKetQua[dem] = NULL;
	}
	ketqua = mangKetQua;
	return _strrev((char*)ketqua.c_str());
}
string TwoExp(int x)
{
	string kq = "1";
	for (int i = 1; i <= x; i++)
	{
		kq = MultipTwo(kq);
	}
	return kq;
}
bitset<128> SubtractOne(bitset<128> bu2)
{
	bitset<128> mangBu1; //Lưu kết quả trả về
	bool nho, kq;

	// Điền bit phải cùng
	if (bu2[127] == 1)
	{
		nho = 0;
		mangBu1[127] = 0;
	}
	else
	{
		nho = 1;
		mangBu1[127] = 1;
	}

	//Đi từ bit kế cuối từ phải qua trái vì đã xét bit cuối ở trên
	for (int i = 126; i >= 0; i--)
	{
		if (bu2[i] == 1 && nho == 1)
		{
			kq = 0;
			nho = 0;
		}
		else if ((bu2[i] == 0 && nho == 1))
		{
			kq = 1;
			nho = 1;
		}
		else if (bu2[i] == 1 && nho == 0)
		{
			kq = 1;
			nho = 0;
		}
		else
		{
			kq = 0;
			nho = 0;
		}

		mangBu1[i] = kq;
	}
	return mangBu1;
}

void ScanQInt(QInt &x)
{
	//B1: Nhập số nguyên lớn dưới dạng chuỗi
	string sNhap;
	cout << endl << "Nhap so lon: ";
	getline(cin, sNhap);
	string sTemp = sNhap;

	//B2: Đổi sang hệ nhị phân và lưu vào QInt
	bitset<128> kq;
	if (sTemp[0] != '-')//Số nhập vào là số dương
	{
		kq = ConvertToBinary(sTemp);
		x.Set(kq);


	}
	else //Số nhập vào là số âm
	{
		sTemp.erase(sTemp.begin()); //Đổi thành số dương bằng cách xóa kí tự '-'
		kq = ConvertToBinary(sTemp); //Thực hiện đổi nhị phân tương tự như trên

		//Thực hiện đảo bit để nhận được số bù 1
		for (int i = 0; i < 128; i++)
		{
			if (kq[i] == 1)
			{
				kq[i] = 0;
			}
			else
			{
				kq[i] = 1;
			}
		}

		//Thực hiện cộng 1 vào số bù 1 để nhận được số bù 2
		kq = PlusOne(kq);

		x.Set(kq);
	}
}
void PrintQInt(QInt x)
{
	bitset<128> temp;
	x.Get(temp);

	string bieudien = "0";
	if (temp[0] == 0) //Trường hợp là số dương.
	{
		for (int i = 127; i >= 0; i--)
		{
			if (temp[i] == 1)
			{
				bieudien = AddString(bieudien, TwoExp(127 - i));
			}
		}
		cout << bieudien << endl;
	}
	else //Trường hợp số âm
	{
		temp = SubtractOne(temp); //Trừ 1 để nhận số bù 1

		//Đảo bit để nhận giá trị tuyệt đối của số âm.
		for (int i = 0; i < 128; i++)
		{
			if (temp[i] == 1)
			{
				temp[i] = 0;
			}
			else
			{
				temp[i] = 1;
			}
		}

		//Đổi sang thập phân
		for (int i = 127; i >= 0; i--)
		{
			if (temp[i] == 1)
			{
				bieudien = AddString(bieudien, TwoExp(127 - i));
			}
		}
		cout << "-" + bieudien << endl;
	}
}
bool* DecToBin(QInt x)
{
	bitset<128> temp;
	x.Get(temp);

	bool *kq = new bool[128];
	for (int i = 0; i < 128; i++)
	{
		kq[i] = temp[i];
	}
	return kq;
}
QInt BinToDec(bool *bit)
{
	QInt x;
	bitset<128> temp;
	for (int i = 0; i < 128; i++)
	{
		temp[i] = bit[i];
	}


	x.Set(temp);
	return x;
}
char* BinToHex(bool *a)
{
	int i, j;
	char *kq = new char[33];
	for (i = 0, j = 0; i < 128, j < 32; i = i + 4, j++)
	{
		if (a[i] == 0 && a[i + 1] == 0 && a[i + 2] == 0 && a[i + 3] == 0) kq[j] = '0';
		if (a[i] == 0 && a[i + 1] == 0 && a[i + 2] == 0 && a[i + 3] == 1) kq[j] = '1';
		if (a[i] == 0 && a[i + 1] == 0 && a[i + 2] == 1 && a[i + 3] == 0) kq[j] = '2';
		if (a[i] == 0 && a[i + 1] == 0 && a[i + 2] == 1 && a[i + 3] == 1) kq[j] = '3';
		if (a[i] == 0 && a[i + 1] == 1 && a[i + 2] == 0 && a[i + 3] == 0) kq[j] = '4';
		if (a[i] == 0 && a[i + 1] == 1 && a[i + 2] == 0 && a[i + 3] == 1) kq[j] = '5';
		if (a[i] == 0 && a[i + 1] == 1 && a[i + 2] == 1 && a[i + 3] == 0) kq[j] = '6';
		if (a[i] == 0 && a[i + 1] == 1 && a[i + 2] == 1 && a[i + 3] == 1) kq[j] = '7';
		if (a[i] == 1 && a[i + 1] == 0 && a[i + 2] == 0 && a[i + 3] == 0) kq[j] = '8';
		if (a[i] == 1 && a[i + 1] == 0 && a[i + 2] == 0 && a[i + 3] == 1) kq[j] = '9';
		if (a[i] == 1 && a[i + 1] == 0 && a[i + 2] == 1 && a[i + 3] == 0) kq[j] = 'A';
		if (a[i] == 1 && a[i + 1] == 0 && a[i + 2] == 1 && a[i + 3] == 1) kq[j] = 'B';
		if (a[i] == 1 && a[i + 1] == 1 && a[i + 2] == 0 && a[i + 3] == 0) kq[j] = 'C';
		if (a[i] == 1 && a[i + 1] == 1 && a[i + 2] == 0 && a[i + 3] == 1) kq[j] = 'D';
		if (a[i] == 1 && a[i + 1] == 1 && a[i + 2] == 1 && a[i + 3] == 0) kq[j] = 'E';
		if (a[i] == 1 && a[i + 1] == 1 && a[i + 2] == 1 && a[i + 3] == 1) kq[j] = 'F';
	}
	kq[32] = NULL;
	return kq;
}
char* DecToHex(QInt x)
{
	bool* kq1 = DecToBin(x);
	return BinToHex(kq1);
}

void QInt::Set(bitset<128> a)
{
	for (int i = 0; i < 128; i++)
	{
		mangbit[i] = a[i];
	}
}
void QInt::Get(bitset<128> &a)
{
	for (int i = 0; i < 128; i++)
	{
		a[i] = mangbit[i];
	}
}

//Toán tử AND, OR, NOT, XOR
QInt QInt::operator&(QInt B)
{
	QInt kq;
	for (int i = 0; i < 128; i++)
	{
		if (mangbit[i] == 1 && B.mangbit[i] == 1)
		{
			kq.mangbit[i] = 1;
		}
		else
		{
			kq.mangbit[i] = 0;
		}
	}
	return kq;
}
QInt QInt::operator|(QInt B)
{
	QInt kq;
	for (int i = 0; i < 128; i++)
	{
		if (mangbit[i] == 0 && B.mangbit[i] == 0)
		{
			kq.mangbit[i] = 0;
		}
		else
		{
			kq.mangbit[i] = 1;
		}
	}
	return kq;
}
QInt QInt::operator^(QInt B)
{
	QInt kq;
	for (int i = 0; i < 128; i++)
	{
		if (mangbit[i] == B.mangbit[i])
		{
			kq.mangbit[i] = 0;
		}
		else
		{
			kq.mangbit[i] = 1;
		}
	}
	return kq;
}
QInt QInt::operator~()
{
	QInt kq;
	for (int i = 0; i < 128; i++)
	{
		if (mangbit[i] == 1)
			kq.mangbit[i] = 0;
		else
			kq.mangbit[i] = 1;
	}
	return kq;
}

//Toán tử so sánh và gán bằng
bool QInt::operator>(QInt B)
{
	if (mangbit[0] == 0 && B.mangbit[0] == 0)
	{
		for (int i = 0; i < 128; i++)
		{
			if (mangbit[i] != B.mangbit[i])
			{
				if (mangbit[i] == 1) return 1;
				else return 0;
			}

		}
	}
	else if (mangbit[0] == 1 && B.mangbit[0] == 1)
	{
		for (int i = 0; i < 128; i++)
		{
			if (mangbit[i] != B.mangbit[i])
			{
				if (mangbit[i] == 1) return 1;
				else return 0;
			}

		}
	}
	else
	{
		if (mangbit[0] == 0) return 1;
		else return 0;
	}
	return 0; //Trường hợp bằng
}
bool QInt::operator<(QInt B)
{
	if ((*this) > B == 0 && ((*this) == B) == 0) return 1;
	return 0;
}
bool QInt::operator==(QInt B)
{
	for (int i = 0; i < 128; i++)
	{
		if (mangbit[i] != B.mangbit[i])
			return 0;
	}
	return 1;
}
bool QInt::operator>=(QInt B)
{
	if (*this > B or *this == B) return 1;
	return 0;
}
bool QInt::operator<=(QInt B)
{
	if (*this < B or *this == B) return 1;
	return 0;
}
QInt& QInt::operator=(QInt B)
{

	(*this).mangbit = B.mangbit;
	return *this;
}
//Toán tử dịch chuyển và xoay bit
QInt QInt::operator>>(string n)
{
	QInt kq;
	kq.mangbit = mangbit;
	for (string i = "0"; i != n; i = AddString(i,"1"))
		kq.mangbit = ShiftRight(kq.mangbit);
	return kq;
}
QInt QInt::operator<<(string n)
{
	QInt kq;
	kq.mangbit = mangbit;
	for (string i = "0"; i != n; i = AddString(i, "1"))
		kq.mangbit = ShiftLeft(kq.mangbit);
	return kq;
}
QInt QInt::rol(string n)
{
	QInt kq;
	kq.mangbit = mangbit;
	for (string i = "0"; i != n; i = AddString(i, "1"))
	{
		kq.mangbit = RolLeft(kq.mangbit);
	}
	return kq;
}
QInt QInt::ror(string n)
{
	QInt kq;
	kq.mangbit = mangbit;
	for (string i = "0"; i != n; i = AddString(i, "1"))
	{
		kq.mangbit = RolRight(kq.mangbit);
	}
	return kq;
}
bitset<128> ShiftRight(bitset<128> x)
{
	bitset<128> kq;
	int i, j;
	for (i = 0, j = 1; i < 127, j < 128; i++, j++)
	{
		kq[j] = x[i];
	}

	if (x[0] == 0) kq[0] = 0;
	else kq[0] = 1;
	return kq;
}
bitset<128> ShiftLeft(bitset<128> x)
{
	bitset<128> kq;
	int i, j;
	for (i = 0, j = 1; i < 127, j < 128; i++, j++)
	{
		kq[i] = x[j];
	}

	kq[127] = 0;
	return kq;
}
bitset<128> RolRight(bitset<128> x)
{
	bitset<128> kq;
	int i, j;
	for (i = 0, j = 1; i < 127, j < 128; i++, j++)
	{
		kq[j] = x[i];
	}

	kq[0] = x[127];
	return kq;
}
bitset<128> RolLeft(bitset<128> x)
{
	bitset<128> kq;
	int i, j;
	for (i = 1, j = 0; i < 128, j < 127; i++, j++)
	{
		kq[j] = x[i];
	}
	kq[127] = x[0];
	return kq;
}
//Toán tử +,-,*,/
QInt QInt::operator+(QInt B)
{
	QInt kq; //Lưu kết quả trả về
	bool nho;

	// Điền bit phải cùng
	if (mangbit[127] == 1 && B.mangbit[127] == 1)
	{
		nho = 1;
		kq.mangbit[127] = 0;
	}
	else if (mangbit[127] == 0 && B.mangbit[127] == 0)
	{
		nho = 0;
		kq.mangbit[127] = 0;
	}
	else
	{
		nho = 0;
		kq.mangbit[127] = 1;
	}

	//Đi từ bit kế cuối từ phải qua trái vì đã xét bit cuối ở trên
	for (int i = 126; i >= 0; i--)
	{
		if (mangbit[i] == 0 && B.mangbit[i] == 0 && nho == 0)
		{
			kq.mangbit[i] = 0;
			nho = 0;
			continue;
		}
		if (mangbit[i] == 0 && B.mangbit[i] == 0 && nho == 1)
		{
			kq.mangbit[i] = 1;
			nho = 0;
			continue;
		}
		if (mangbit[i] == 0 && B.mangbit[i] == 1 && nho == 0)
		{
			kq.mangbit[i] = 1;
			nho = 0;
			continue;
		}
		if (mangbit[i] == 1 && B.mangbit[i] == 0 && nho == 0)
		{
			kq.mangbit[i] = 1;
			nho = 0;
			continue;
		}
		if (mangbit[i] == 0 && B.mangbit[i] == 1 && nho == 1)
		{
			kq.mangbit[i] = 0;
			nho = 1;
			continue;
		}
		if (mangbit[i] == 1 && B.mangbit[i] == 1 && nho == 0)
		{
			kq.mangbit[i] = 0;
			nho = 1;
			continue;
		}
		if (mangbit[i] == 1 && B.mangbit[i] == 0 && nho == 1)
		{
			kq.mangbit[i] = 0;
			nho = 1;
			continue;
		}
		if (mangbit[i] == 1 && B.mangbit[i] == 1 && nho == 1)
		{
			kq.mangbit[i] = 1;
			nho = 1;
			continue;
		}
	}
	return kq;
}
QInt QInt::operator-(QInt B)
{
	B = ~B;
	B.mangbit = PlusOne(B.mangbit);
	return (*this) + B;
}
QInt QInt::operator*(QInt Q)
{
	QInt A("0");
	bool Q1 = 0;
	for (int i = 1; i <= 128; i++)
	{
		if (Q.mangbit[127] == 1 && Q1 == 0)
		{
			A = A - (*this);
		}
		else if (Q.mangbit[127] == 0 && Q1 == 1)
		{
			A = A + (*this);
		}

		bool a0, q0;
		a0 = A.mangbit[127];
		q0 = Q.mangbit[127];
		A = A >> "1";
		Q = Q >> "1";
		Q1 = q0;
		Q.mangbit[0] = a0;
	}
	return Q;
}
QInt QInt::Devide(QInt B)
{
	//Khởi tạo A
	QInt A;
	QInt Q = (*this);
	if ((*this).mangbit[0] == 0)
	{
		QInt C("0");
		A = C;
	}
	else
	{
		QInt C("-1");
		A = C;
	}

	for (int i = 1; i <= 128; i++)
	{
		bool q127 = Q.mangbit[0];
		A = A << "1";
		Q = Q << "1";
		A.mangbit[127] = q127;
		A = A - B;

		if (A.mangbit[0] == 1)
		{
			Q.mangbit[127] = 0;
			A = A + B;
		}
		else
		{
			Q.mangbit[127] = 1;
		}
	}
	return Q;
}
QInt QInt::operator/(QInt B)
{
	QInt kq, A;
	if (mangbit[0] == 0 && B.mangbit[0] == 0)
	{
		return (*this).Devide(B);
	}
	else if (mangbit[0] == 1 && B.mangbit[0] == 0)
	{
		A = (*this);
		A.Set(SubtractOne(A.mangbit));
		A = ~A;

		kq = A.Devide(B);
		kq = ~kq;
		kq.Set(PlusOne(kq.mangbit));
	}
	else if (mangbit[0] == 0 && B.mangbit[0] == 1)
	{
		B.Set(SubtractOne(B.mangbit));
		B = ~B;

		kq = (*this).Devide(B);
		kq = ~kq;
		kq.Set(PlusOne(kq.mangbit));
	}
	else
	{
		A = (*this);
		A.Set(SubtractOne(A.mangbit));
		A = ~A;

		B.Set(SubtractOne(B.mangbit));
		B = ~B;

		kq = A.Devide(B);
	}
	return kq;
}

string DecToBin(string s)
{
	string kq;
	char *temp = new char[129];
	QInt x(s);
	bool *a = DecToBin(x);
	for (int i = 0; i < 128; i++)
	{
		temp[i] = a[i] + 48;
	}
	temp[128] = NULL;
	kq = temp;
	kq = ShortStringBinary(kq);
	return kq;
}
string QIntToDec(QInt x)
{
	bitset<128> temp;
	x.Get(temp);

	string bieudien = "0";
	if (temp[0] == 0) //Trường hợp là số dương.
	{
		for (int i = 127; i >= 0; i--)
		{
			if (temp[i] == 1)
			{
				bieudien = AddString(bieudien, TwoExp(127 - i));
			}
		}
		return bieudien;
	}
	else //Trường hợp số âm
	{
		temp = SubtractOne(temp); //Trừ 1 để nhận số bù 1

		//Đảo bit để nhận giá trị tuyệt đối của số âm.
		for (int i = 0; i < 128; i++)
		{
			if (temp[i] == 1)
			{
				temp[i] = 0;
			}
			else
			{
				temp[i] = 1;
			}
		}

		//Đổi sang thập phân
		for (int i = 127; i >= 0; i--)
		{
			if (temp[i] == 1)
			{
				bieudien = AddString(bieudien, TwoExp(127 - i));
			}
		}
		return "-" + bieudien;
	}
}
string BinToDec(string s)
{
	//Đưa chuỗi đã nhập vào bitset temp
	int i, j, k;
	bool* temp = new bool[128];
	/*if (s[0] == '1' && s.length() != 128)
	{*/
	for (i = s.length() - 1, j = 127; i >= 0; i--, j--)
	{
		temp[j] = s[i] - 48;
	}

	for (k = j; k >= 0; k--)
	{
		temp[k] = 0;
	}
	/*}*/
	/*else
	{
		for (i = s.length() - 1, j = 127; i >= 0; i--, j--)
		{
			temp[j] = s[i] - 48;
		}

		for (k = j; k >= 0; k--)
		{
			temp[k] = 1;
		}
	}*/
	QInt x = BinToDec(temp);
	return QIntToDec(x);
}
string BinToHex(string s)
{
	//Đưa chuỗi đã nhập vào bitset temp
	int i, j, k;
	bool* temp = new bool[128];
	if (s[0] == '1' && s.length() != 128) // Nếu là số dương
	{
		for (i = s.length() -
			1, j = 127; i >= 0; i--, j--)
		{
			temp[j] = s[i] - 48;
		}

		for (k = j; k >= 0; k--)
		{
			temp[k] = 0;
		}
	}
	else
	{
		for (i = s.length() - 1, j = 127; i >= 0; i--, j--)
		{
			temp[j] = s[i] - 48;
		}

		for (k = j; k >= 0; k--)
		{
			temp[k] = 1;
		}
	}
	return BinToHex(temp);
}
string DecToHex(string s)
{
	string kq = DecToBin(s);
	kq = BinToHex(kq);
	kq = ShortStringHex(kq);
	return kq;
}
string HexToBin(string s)
{
	int i, j, k;
	char *kq = new char[129];
	for (i = s.length() - 1, j = 127; i >= 0; i--, j = j - 4)
	{
		switch (s[i])
		{
		case '0':
		{
			kq[j] = 0; kq[j - 1] = 0; kq[j - 2] = 0; kq[j - 3] = 0; break;
		}
		case '1':
		{
			kq[j] = 1; kq[j - 1] = 0; kq[j - 2] = 0; kq[j - 3] = 0; break;
		}
		case '2':
		{
			kq[j] = 0; kq[j - 1] = 1; kq[j - 2] = 0; kq[j - 3] = 0; break;
		}
		case '3':
		{
			kq[j] = 1; kq[j - 1] = 1; kq[j - 2] = 0; kq[j - 3] = 0; break;
		}
		case '4':
		{
			kq[j] = 0; kq[j - 1] = 0; kq[j - 2] = 1; kq[j - 3] = 0; break;
		}
		case '5':
		{
			kq[j] = 1; kq[j - 1] = 0; kq[j - 2] = 1; kq[j - 3] = 0; break;
		}
		case '6':
		{
			kq[j] = 0; kq[j - 1] = 1; kq[j - 2] = 1; kq[j - 3] = 0; break;
		}
		case '7':
		{
			kq[j] = 1; kq[j - 1] = 1; kq[j - 2] = 1; kq[j - 3] = 0; break;
		}
		case '8':
		{
			kq[j] = 0; kq[j - 1] = 0; kq[j - 2] = 0; kq[j - 3] = 1; break;
		}
		case '9':
		{
			kq[j] = 1; kq[j - 1] = 0; kq[j - 2] = 0; kq[j - 3] = 1; break;
		}
		case 'A':
		{
			kq[j] = 0; kq[j - 1] = 1; kq[j - 2] = 0; kq[j - 3] = 1; break;
		}
		case 'B':
		{
			kq[j] = 1; kq[j - 1] = 1; kq[j - 2] = 0; kq[j - 3] = 1; break;
		}
		case 'C':
		{
			kq[j] = 0; kq[j - 1] = 0; kq[j - 2] = 1; kq[j - 3] = 1; break;
		}
		case 'D':
		{
			kq[j] = 1; kq[j - 1] = 0; kq[j - 2] = 1; kq[j - 3] = 1; break;
		}
		case 'E':
		{
			kq[j] = 0; kq[j - 1] = 1; kq[j - 2] = 1; kq[j - 3] = 1; break;
		}
		case 'F':
		{
			kq[j] = 1; kq[j - 1] = 1; kq[j - 2] = 1; kq[j - 3] = 1; break;
		}
		}
	}
	//Điền thêm số 0
	for (k = j; k >= 0; k--)
	{
		kq[k] = 0;
	}
	//Đổi Dec thành kí tự
	for (i = 0; i < 128; i++)
	{
		kq[i] = kq[i] + 48;
	}
	kq[128] = '\0';
	return kq;
}
string HexToDec(string s)
{
	return BinToDec(HexToBin(s));
}
string Convert(string mode1, string mode2, string s)
{
	string kq;
	if (mode1 == "2" && mode2 == "10")
	{
		kq = BinToDec(s);
	}
	else if (mode1 == "10" && mode2 == "2")
	{
		kq = DecToBin(s);
	}
	else if (mode1 == "2" && mode2 == "16")
	{
		kq = BinToHex(s);
	}
	else if (mode1 == "10" && mode2 == "16")
	{
		kq = DecToHex(s);
	}
	return kq;
}

string CalcuBin2(string s1, string s2, string oper)
{
	string kq;
	if (oper == "&")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A & B;
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == "|")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A | B;
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == "^")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A ^ B;
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == "+")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A + B;
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == "*")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A * B;
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == "/")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A / B;
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == "-")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A - B;
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == ">")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A > B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "<")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A < B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "==")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A == B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == ">=")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A >= B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "<=")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A <= B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "<<")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A << s2;
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == ">>")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A >> s2;
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == "rol")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A.rol(s2);
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	else if (oper == "ror")
	{
		s1 = BinToDec(s1);
		s2 = BinToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A.ror(s2);
		kq = QIntToDec(C);
		kq = DecToBin(kq);
	}
	return kq;
}
string CalcuDec2(string s1, string s2, string oper)
{
	string kq;
	if (oper == "&")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A & B;
		kq = QIntToDec(C);
	}
	else if (oper == "|")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A | B;
		kq = QIntToDec(C);
	}
	else if (oper == "^")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A ^ B;
		kq = QIntToDec(C);
	}
	else if (oper == "+")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A + B;
		kq = QIntToDec(C);
	}
	else if (oper == "*")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A * B;
		kq = QIntToDec(C);
	}
	else if (oper == "/")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A / B;
		kq = QIntToDec(C);
	}
	else if (oper == "-")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A - B;
		kq = QIntToDec(C);
	}
	else if (oper == ">")
	{
		QInt A(s1);
		QInt B(s2);
		bool C = A > B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "<")
	{
		QInt A(s1);
		QInt B(s2);
		bool C = A < B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "==")
	{
		QInt A(s1);
		QInt B(s2);
		bool C = A == B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == ">=")
	{
		QInt A(s1);
		QInt B(s2);
		bool C = A >= B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "<=")
	{
		QInt A(s1);
		QInt B(s2);
		bool C = A <= B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "<<")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A << s2;
		kq = QIntToDec(C);
	}
	else if (oper == ">>")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A >> s2;
		kq = QIntToDec(C);
	}
	else if (oper == "rol")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A.rol(s2);
		kq = QIntToDec(C);
	}
	else if (oper == "ror")
	{
		QInt A(s1);
		QInt B(s2);
		QInt C = A.ror(s2);
		kq = QIntToDec(C);
	}

	return kq;
}
string CalcuHex2(string s1, string s2, string oper)
{
	string kq;
	if (oper == "&")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A & B;
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == "|")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A | B;
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == "^")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A ^ B;
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == "+")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A + B;
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == "-")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A - B;
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == "*")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A * B;
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == "/")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A / B;
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == "<<")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A << s2;
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == ">>")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A >> s2;
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == "rol")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A.rol(s2);
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == "ror")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		QInt C = A.ror(s2);
		kq = QIntToDec(C);
		kq = DecToHex(kq);
	}
	else if (oper == ">")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A > B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "<")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A < B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "==")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A == B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == ">=")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A >= B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	else if (oper == "<=")
	{
		s1 = HexToDec(s1);
		s2 = HexToDec(s2);
		QInt A(s1);
		QInt B(s2);
		bool C = A <= B;
		if (C == 1) kq = "1";
		else kq = "0";
	}
	return kq;
}
string Calcu2(string mode, string s1, string s2, string oper)
{
	string kq;
	if (mode == "2")
	{
		kq = CalcuBin2(s1, s2, oper);
	}
	else if (mode == "16")
	{
		kq = CalcuHex2(s1, s2, oper);
	}
	else if (mode == "10")
	{
		kq = CalcuDec2(s1, s2, oper);
	}
	return kq;
}

bool Check1(string x)
{
	for (int i = 0; i < 128; i++)
	{
		if (x[i] == '0') return 0;
	}
	return 1;
}
bool Check0(string x)
{
	for (int i = 0; i < x.length(); i++)
	{
		if (x[i] != '0') return 0;
	}
	return 1;
}
string ShortStringBinary(string x)
{
	if (Check0(x) || Check1(x)) return x;

	int i;
	if (x[0] == '0') //Số dương
	{
		for (i = 0; i < x.length(); i++)
		{
			if (x[i] != '0') break;

		}
		x = x.erase(0, i);
	}
	//Số âm không cần thu gọn
	//else 
	//{
	//	for (i = 0; i < x.length(); i++)
	//	{
	//		if (x[i] != 'F') break;

	//	}
	//	x = x.erase(0, i);
	//}
	return x;
}
string ShortStringHex(string x)
{
	if (Check0(x)) return x;
	int i;
	if (x[0] == '0') //Số dương
	{
		for (i = 0; i < x.length(); i++)
		{
			if (x[i] != '0') break;

		}
		x = x.erase(0, i);
	}
	return x;
}

int CountSpace(string s)
{
	int dem = 0;
	for (int i = 0; i < s.length(); i++)
	{
		if (s[i] == ' ') dem++;
	}
	return dem;
}

void DevString1(string x, string &mode1, string &mode2, string &s)
{
	int i, j;
	for (i = 0; i < x.length(); i++)
	{
		if (x[i] == ' ')
		{
			mode1 = x.substr(0, i);
			break;
		}
	}

	for (j = i + 1; j < x.length(); j++)
	{
		if (x[j] == ' ')
		{
			mode2 = x.substr(i + 1, j - i - 1);
			break;
		}
	}

	s = x.substr(j + 1, x.length() - j - 1);
}
void DevString2(string x, string &s1, string &s2, string &mode, string &oper)
{
	int i, j, k;
	for (i = 0; i < x.length(); i++)
	{
		if (x[i] == ' ')
		{
			mode = x.substr(0, i);
			break;
		}
	}

	for (j = i + 1; j < x.length(); j++)
	{
		if (x[j] == ' ')
		{
			s1 = x.substr(i + 1, j - i - 1);
			break;
		}
	}
	for (k = j + 1; k < x.length(); k++)
	{
		if (x[k] == ' ')
		{
			oper = x.substr(j + 1, k - j - 1);
			break;
		}
	}

	s2 = x.substr(k + 1, x.length() - k - 1);
}
void Run(string filein, string fileout)
{
	//Mở file input và đọc dữ liệu vào.
	ifstream FileIn;
	FileIn.open(filein, ios::in);
	if (!FileIn.is_open())
	{
		cout << endl << "Khong mo duoc File " << filein;
		exit(0);
	}
	vector<string> yeucau;
	string temp;
	while (!FileIn.eof())
	{
		getline(FileIn, temp);
		yeucau.push_back(temp);
	}
	FileIn.close();


	//Mở file output ghi kết quả vào.
	ofstream FileOut;
	FileOut.open(fileout, ios::out);
	for (int i = 0; i < yeucau.size(); i++)
	{
		if (CountSpace(yeucau[i]) == 3)
		{
			string s1, s2, mode, oper;
			DevString2(yeucau[i], s1, s2, mode, oper);
			FileOut << Calcu2(mode, s1, s2, oper) << endl;
		}
		else
		{
			if (CheckNot(yeucau[i]) == 0)
			{
				string mode1, mode2, s;
				DevString1(yeucau[i], mode1, mode2, s);
				FileOut << Convert(mode1, mode2, s) << endl;
			}
			else
			{
				string mode, oper, s;
				DevString1(yeucau[i], mode, oper, s);
				if (mode == "2")
				{
					QInt A(BinToDec(s));
					A = ~A;
					FileOut << DecToBin(QIntToDec(A)) << endl;
				}
				else if (mode == "10")
				{
					QInt A(s);
					A = ~A;
					FileOut << QIntToDec(A) << endl;
				}
				else if (mode == "16")
				{
					QInt A(HexToDec(s));
					A = ~A;
					FileOut << DecToHex(QIntToDec(A)) << endl;
				}
			}

		}
	}
}
bool CheckNot(string s)
{
	for (int i = 0; i < s.length(); i++)
	{
		if (s[i] == '~') return 1;
	}
	return 0;
}

QInt::QInt(string x)
{
	//B2: Đổi sang hệ nhị phân và lưu vào QInt
	bitset<128> kq;
	if (x[0] != '-')//Số nhập vào là số dương
	{
		kq = ConvertToBinary(x);
		(*this).Set(kq);
	}
	else //Số nhập vào là số âm
	{
		x.erase(x.begin()); //Đổi thành số dương bằng cách xóa kí tự '-'
		kq = ConvertToBinary(x); //Thực hiện đổi nhị phân tương tự như trên

		//Thực hiện đảo bit để nhận được số bù 1
		for (int i = 0; i < 128; i++)
		{
			if (kq[i] == 1)
			{
				kq[i] = 0;
			}
			else
			{
				kq[i] = 1;
			}
		}

		//Thực hiện cộng 1 vào số bù 1 để nhận được số bù 2
		kq = PlusOne(kq);

		(*this).Set(kq);
	}
}
QInt::QInt()
{

}
QInt::~QInt()
{
}

//==============================QFLOAT===================================

QFloat::QFloat(string s)
{
	for (int i = 0; i < 128; i++)
	{
		bit[i] = s[i] - 48;
	}
}

QFloat::QFloat()
{
}

QFloat::~QFloat()
{
}

bitset<128> floatingPoint(string s)
{
	bitset<128> kq;
	bitset<1>bitDau;
	bitset<15>bitExp;
	bitset<112>bitSign;
	if (s[0] == '-')							// kiem tra neu la so am thi cho bit dau =1 va xoa dau
	{
		bitDau[0] = 1;
		s.erase(s.begin());
	}
	else
		bitDau[0] = 0;
	string phanNguyen, phanThapPhan;		// mang tam de luu 2 phan cua so
	int k = s.length(); //vi tri dau phan chia 2 phan
	for (int i = 0; i < s.length(); i++)
	{
		if (s[i] == '.')
		{
			k = i;
			break;
		}
	}


	phanNguyen = s.substr(0, k);
	if (k == s.length())
		phanThapPhan = "0";
	else
		phanThapPhan = s.substr(k + 1);
	if (phanNguyen != "0")
	{

		// chuyen phan nguyen sang binary
		bitset<128> binNguyen;
		int i, j;
		bool sodu;
		string thuong = DevideByTwo(phanNguyen, sodu);
		char *sBinary = new char[100];

		if (phanNguyen[phanNguyen.length() - 1] == '1' || phanNguyen[phanNguyen.length() - 1] == '3' || phanNguyen[phanNguyen.length() - 1] == '5'
			|| phanNguyen[phanNguyen.length() - 1] == '7' || phanNguyen[phanNguyen.length() - 1] == '9')
		{
			binNguyen[0] = 1;
		}
		else
		{
			binNguyen[0] = 0;
		}

		for (i = 1; thuong != "0"; i++)
		{
			thuong = DevideByTwo(thuong, sodu);
			binNguyen[i] = sodu;
		}

		// 2^E
		int E;
		E = i - 1;
		int giatriE = E + 16383;
		// chuyen E sang binary va luu vao phan exp
		// Exp duoc luu nguoc lai
		for (int i = 14; i >= 0; i--)
		{
			bitExp[i] = giatriE & 1;
			giatriE = giatriE >> 1;
		}
		// phan bitSign duoc luu nguoc lai
		//chuyen sang dang 1.F * 2^E va luu E bit cuoi cua phan nguyen vao phan Sign
		for (int i = 0; i < E; i++)
		{
			bitSign[i] = binNguyen[E - 1 - i];
		}

		// chuyen phan thap phan sang binary va luu vao sau phan tren
		string str;
		for (int i = E; i < 112; i++)
		{
			str = MultipTwo(phanThapPhan);
			if (str.length() > phanThapPhan.length())
			{
				bitSign[i] = 1;
				phanThapPhan = str;
				phanThapPhan.erase(phanThapPhan.begin());
			}
			else
			{
				bitSign[i] = 0;
				phanThapPhan = str;
			}
			// chưa làm tròn số khi lặp vô tận
		}
	}
	else
	{

		string str;
		int DieuKien;
		int  E = 0;
		do {

			str = MultipTwo(phanThapPhan);
			if (str.length() > phanThapPhan.length())
			{
				DieuKien = 1;
				phanThapPhan = str;
				phanThapPhan.erase(phanThapPhan.begin());
				E = E - 1;
				break;
			}
			else
			{
				DieuKien = 0;
				phanThapPhan = str;
				E = E - 1;
			}
			// chưa làm tròn số khi lặp vô tận

		} while (DieuKien == 0);

		int giatriE = E + 16383;
		// chuyen E sang binary va luu vao phan exp
		// Exp duoc luu nguoc lai
		for (int i = 14; i >= 0; i--)
		{
			bitExp[i] = giatriE & 1;
			giatriE = giatriE >> 1;
		}
		for (int i = 0; i < 112; i++)
		{
			str = MultipTwo(phanThapPhan);
			if (str.length() > phanThapPhan.length())
			{
				bitSign[i] = 1;
				phanThapPhan = str;
				phanThapPhan.erase(phanThapPhan.begin());
			}
			else
			{
				bitSign[i] = 0;
				phanThapPhan = str;
			}
		}
	}

	//luu vao bitset kq de tra ve kieu bitset<128>
	kq[0] = bitDau[0];
	for (int i = 0; i < 15; i++)
	{
		kq[1 + i] = bitExp[i];
	}
	for (int i = 0; i < 112; i++)
	{
		kq[i + 16] = bitSign[i];
	}
	return kq;
}

void ScanQfloat(QFloat &x)
{
	string str;
	cout << "Nhap so: ";
	getline(cin, str);
	bitset<128> temp;
	temp = floatingPoint(str);
	x.Set(temp);
}

string floatingPointToDec(QFloat x)
{
	// tao bitset temp de luu QFloat x
	bitset<128> temp;
	temp = x.Get();
	string kq;
	// chia temp thanh 3 bitset de luu 3 phan cua so cham dong
	bitset<1>bitDau;
	bitset<15>bitExp;
	bitset<112>bitSign;
	bitDau[0] = temp[0];
	for (int i = 0; i < 15; i++)
	{
		bitExp[i] = temp[i + 1];
	}
	for (int i = 0; i < 112; i++)
	{
		bitSign[i] = temp[i + 16];
	}
	// xet bit dau
	if (bitDau[0] == 1)
	{
		kq = "-"; // tao so am
	}
	else
	{
		kq = "";
	}
	// tinh gia tri cua 15 bitExp
	int giaTriExp = 0;
	for (int i = 0; i < 15; i++)
	{
		if (bitExp[i] == 1)
		{
			giaTriExp += pow(2, 14 - i);
		}
	}
	int E = giaTriExp - 16383;
	if (E >= 0)
	{
		string phanNguyen = "0", phanThapPhan = "0";
		// lay E bit dau tien cua phan bitSign, chuyen sang thap phan va luu vao phan nguyen

		string binNguyen = "1";
		for (int i = 0; i < E; i++)
		{
			if (bitSign[i] == 0)
			{
				binNguyen += "0";
			}
			else
			{
				binNguyen += "1";
			}
		}

		for (int i = 0; i < binNguyen.length(); i++)
		{
			if (binNguyen[i] == '1')
			{
				phanNguyen = AddString(phanNguyen, TwoExp(binNguyen.length() - i - 1));
			}
		}

		// chuyen 112 - E bit trong phan Sign sang thap phan
		string chuoi = "1";
		for (int i = E; i < 112; i++)
		{
			bool s;
			chuoi = chuoi + "0";
			chuoi = DevideByTwo(chuoi, s);

			if (bitSign[i] == 1)
				phanThapPhan = AddString(phanThapPhan, chuoi);
			phanThapPhan = phanThapPhan + "0";

		}
		/*string pl = "5";
		for (int i = E; i < 112; i++)
		{
			pl += "0";
		}
		for (int i = E; i < 112; i++)
		{
			if (bitSign[i] == 1)
			{
				phanThapPhan = AddString(phanThapPhan, pl);
			}
			bool sodu;
			pl = DevideByTwo(pl, sodu);
		}*/
		// tim vi tri bat dau cua chuoi so 0
		int flag = 0;
		for (int i = phanThapPhan.length() - 1; i >= 0; i--)
		{
			if (phanThapPhan[i] != '0')
			{
				flag = i + 1;
				break;
			}
		}
		// chuan hoa chuoi, xoa chuoi so 0 dang sau phan thap phan

		phanThapPhan.erase(phanThapPhan.begin() + flag, phanThapPhan.end());
		// luu phan nguyen, phan thap phan vao chuoi kq
		kq += phanNguyen;
		kq += ".";
		kq += phanThapPhan;
	}
	else
	{

		string phanNguyen = "0.", phanThapPhan = "", chuoi = "1";
		bool s;                 // áp dụng nhỏ trong hàm, ko có giá trị cần sử dụng
		for (int i = 1; i <= -E; i++)
			chuoi = chuoi + "0";
		for (int i = 1; i <= -E; i++)
		{
			phanThapPhan = phanThapPhan + "0";
			chuoi = DevideByTwo(chuoi, s);
		}
		phanThapPhan = AddString(phanThapPhan, chuoi);

		for (int i = 0; i < 112; i++)
		{
			bool s;
			chuoi = chuoi + "0";
			phanThapPhan = phanThapPhan + "0";
			chuoi = DevideByTwo(chuoi, s);
			if (bitSign[i] == 1)
				phanThapPhan = AddString(phanThapPhan, chuoi);

		}
		// tim vi tri bat dau cua chuoi so 0
		int flag = 0;
		for (int i = phanThapPhan.length() - 1; i >= 0; i--)
		{
			if (phanThapPhan[i] != '0')
			{
				flag = i + 1;
				break;
			}
		}
		// chuan hoa chuoi, xoa chuoi so 0 dang sau phan thap phan

		phanThapPhan.erase(phanThapPhan.begin() + flag, phanThapPhan.end());
		// luu phan nguyen, phan thap phan vao chuoi kq
		kq += phanNguyen;
		kq += phanThapPhan;
	}
	return kq;
}

bool *DecToBin2(QFloat x)
{
	bool* kq = new bool[128];
	bitset<128> temp = x.Get();
	for (int i = 0; i < 128; i++)
	{
		kq[i] = temp[i];
	}
	return kq;
}

QFloat BinToDec2(bool *bit)
{
	bitset<128> temp;
	for (int i = 0; i < 128; i++)
	{
		temp[i] = bit[i];
	}
	QFloat x;
	x.Set(temp);
	return x;
}

void PrintQfloat(QFloat x)
{
	cout << "Dang cham dong: " << endl;
	bitset<128>temp = x.Get();
	for (int i = 0; i < 128; i++)
	{
		cout << temp[i];
	}
	cout << endl << "Dang thap phan: " << endl;
	cout << floatingPointToDec(x) << endl;
}

void Run2(string filein, string fileout)
{
	//Mở file input và đọc dữ liệu vào.
	ifstream FileIn;
	FileIn.open(filein, ios::in);
	if (!FileIn.is_open())
	{
		cout << endl << "Khong mo duoc File " << filein;
		exit(0);
	}
	vector<string> yeucau;
	string temp;
	while (!FileIn.eof())
	{
		getline(FileIn, temp);
		yeucau.push_back(temp);
	}
	FileIn.close();


	//Mở file output ghi kết quả vào.
	ofstream FileOut;
	FileOut.open(fileout, ios::out);
	for (int i = 0; i < yeucau.size(); i++)
	{
		string mode1, mode2, s;
		DevString1(yeucau[i], mode1, mode2, s);
		if (mode1 == "2")
		{
			QFloat x(s);
			FileOut << floatingPointToDec(x) << endl;
		}
		else if (mode1 == "10")
		{
			bitset<128> temp = floatingPoint(s);
			string kq = temp.to_string();
			char *kq1 = _strrev((char *)kq.c_str());

			FileOut << kq1 << endl;
		}
	}
}



