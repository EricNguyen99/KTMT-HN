#pragma once
#include <bitset>
#include <iostream>
#include <cmath>
#include <string>
#include <fstream>
#include <vector>
#include <string.h>
using namespace std;

//==============================QINT===================================
class QInt
{
private:
	bitset<128> mangbit;
public:
	void Set(bitset<128> a);
	void Get(bitset<128> &a);

	//4 Toán tử trên bit AND, OR, XOR, NOT
	QInt operator&(QInt B);
	QInt operator|(QInt B);
	QInt operator^(QInt B);
	QInt operator~();

	// Các toán tử so sánh và gán.
	bool operator>(QInt B);
	bool operator<(QInt B);
	bool operator==(QInt B);
	bool operator>=(QInt B);
	bool operator<=(QInt B);
	QInt& operator=(QInt B);

	//Toán tử dịch, xoay bit
	QInt operator>>(string n);
	QInt operator<<(string n);
	QInt rol(string n);
	QInt ror(string n);

	//Toán tử cộng, trừ, nhân, chia
	QInt operator+(QInt B);
	QInt operator-(QInt B);
	QInt operator*(QInt B);
	QInt operator/(QInt B);
	QInt Devide(QInt B);


	QInt();
	QInt(string x); //Khởi tạo với tham số là chuỗi số hệ 10
	~QInt();
};

//HÀM BỔ TRỢ CHO HÀM SCANQINT
//1. Chuỗi s/2 return về thương (string), số dư là 1 kí tự được lưu trong biến sodu.
string DevideByTwo(string s, bool &sodu);
//2. Đổi s (chuỗi dương) sang nhị phân dạng 128bit
bitset<128> ConvertToBinary(string s);
//3. Cộng 1 vào chuỗi nhị phân bù 1 để nhận được chuỗi nhị phân bù 2
bitset<128> PlusOne(bitset<128> bu1);

//HÀM BỔ TRỢ CHO HÀM PRINTQINT
//1. Cộng chuỗi: VD: "123" + "4567" = "4690"
string AddString(string x, string y);
//2. Nhân chuỗi với 2
string MultipTwo(string s);
//3. Lũy thừa của 2
string TwoExp(int x);
//4. Lấy số bù 2 trừ 1 để có số bù 1
bitset<128> SubtractOne(bitset<128> bu2);

//CÁC HÀM HỖ TRỢ CÁC TOÁN TỬ XOAY BIT, DỊCH BIT
// Hàm bổ trợ operator >>: Dịch phải 1 bit
bitset<128> ShiftRight(bitset<128> x);
// Hàm bổ trợ operator <<: Dịch trái 1 bit
bitset<128> ShiftLeft(bitset<128> x);
// Hàm bổ trợ hàm ror: Xoay phải 1 bit
bitset<128> RolRight(bitset<128> x);
// Hàm bổ trợ hàm rol: Xoay trái 1 bit
bitset<128> RolLeft(bitset<128> x);


//CÁC HÀM TÍNH TOÁN 2 TOÁN HẠNG
//Tính ở hệ 2 (2 toán hạng)
string CalcuBin2(string s1, string s2, string oper);
//Tính ở hệ 10 (2 toán hạng)
string CalcuDec2(string s1, string s2, string oper);
//Tính ở hệ 16 (2 toán hạng)
string CalcuHex2(string s1, string s2, string oper);
// Tính toán ở hệ mode cho các toán tử (2 toán hạng)
string Calcu2(string mode, string s1, string s2, string oper);

//HÀM HỖ TRỢ TRONG VIỆC XUẤT KẾT QUẢ
//Thu gọn chuỗi về dạng ngắn
string ShortStringBinary(string x);
//Thu gọn chuỗi hệ 16 về dạng ngắn
string ShortStringHex(string x);
//Kiểm tra xem 1 string có phải là dãy toàn bit 1 hay không.
bool Check1(string x);
//Kiểm tra xem 1 string có phải là dãy toàn bit 0 hay không.
bool Check0(string x);


//CÁC HÀM ĐỔI QUA LẠI GIỮA CÁC HỆ SỐ ĐẾM
//Đổi hệ 10 về hệ 2
string DecToBin(string s);
//Đổi hệ 2 về hệ 10
string BinToDec(string s);
//Chuyển QInt sang dạng thập phân
string QIntToDec(QInt x);
//Chuyển hệ 2 sang hệ 16
string BinToHex(string s);
//Chuyển hệ 10 sang hệ 16;
string DecToHex(string s);
//Chuyển từ hệ 16 sang hệ 2
string HexToBin(string s);
//Chuyển từ hệ 16 sang hệ 10
string HexToDec(string s);
// Đổi số từ hệ mode1 sang hệ mode2
string Convert(string mode1, string mode2, string s);

//CÁC HÀM THEO NGUYÊN MẪU HÀM CỦA ĐỀ
void ScanQInt(QInt &x);
void PrintQInt(QInt x);
bool *DecToBin(QInt x);
QInt BinToDec(bool *bit);
char *BinToHex(bool *bit);
char *DecToHex(QInt x);

//HÀM XỬ LÍ INPUT, OUTPUT
// Hàm đếm số khoảng trắng của một chuỗi.
int CountSpace(string s);
//Hàm tách chuỗi x thành 3 chuỗi con lưu vào s1, mode, oper với phân cách là các khoảng trống.
void DevString1(string x, string &s1, string &mode, string &oper);
//Hàm tách chuỗi x thành 4 chuỗi con lưu vào s1, s2, mode, oper với phân cách là các khoảng trống.
void DevString2(string x, string &s1, string &s2, string &mode, string &oper);
//Hàm chạy chương trình với tham số truyền vào là tên file cần đọc và file xuất kết quả.
void Run(string filein, string fileout);
//Kiểm tra chuỗi s có chứa kí tự ~ hay không.
bool CheckNot(string s);

//==============================QFLOAT===================================
class QFloat
{
private:
	bitset<128> bit;
public:
	void Set(bitset<128> a)
	{
		for (int i = 0; i < 128; i++)
		{
			bit[i] = a[i];
		}
	}

	bitset<128> Get()
	{
		return bit;
	}
	QFloat();
	QFloat(string s);
	~QFloat();
};

bitset<128> floatingPoint(string s);
string floatingPointToDec(QFloat x);
void ScanQfloat(QFloat &x);
bool* DecToBin2(QFloat x);
QFloat BinToDec2(bool *bit);
void PrintQfloat(QFloat x);
void Run2(string filein, string fileout);
