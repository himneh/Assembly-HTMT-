#include "SupeLib.h"

string ConvertDECtoBIN8bits(int k)//ham chuyen thap phan sang nhi phan
{
	int dec = abs(k);
	int tmp = 0;
	string res = "";

	while (dec > 0)
	{
		string temp = "";
		tmp = dec % 2;
		temp = (tmp)+48;
		res += temp;
		dec /= 2;
	}
	string s2 = "";
	for (int i = res.size() - 1; i >= 0; i--)
		s2 += res[i];
	s2 = fitBits(s2);
	return s2;
}

string fitBits(string s)//ham fill day bit cho du 8 so
{
	int size = s.size();
	string ans = "";
	if (size < 8)
	{
		string uwu = "";
		for (int i = 0; i < (8 - size); i++)
			uwu += '0';
		uwu += s;
		ans = uwu;
		return ans;
	}
	else return s;
}

string Add_Bit(string st, string nd)//Ham cong bit
{
	string res = "";
	int carry = 0;
	fitBits(st);
	fitBits(nd);
	for (int i = 7; i >= 0; i--)
	{
		int firstBit = st[i] - '0';
		int secondBit = nd[i] - '0';
		int sum = (firstBit ^ secondBit ^ carry) + '0';

		res = (char)sum + res;

		carry = (firstBit & secondBit) | (secondBit & carry) | (firstBit & carry);
	}

	if (carry)
		res = '1' + res;
	res = fixSize(res);
	return res;
}

string Sub_Bit(string st, string nd)//ham tru bit
{
	string res = "";
	string stcp = "";
	string ndcp = "";
	stcp = fitBits(st);
	ndcp = fitBits(nd);
	
	cal_1_Complement(ndcp);
	cal_2_Complement(ndcp);


	res = Add_Bit(stcp, ndcp);
	return fixSize(res);
}

string fixSize(string s)//ham xu li tran so
{
	string ans = "";
	if (s.size() > 8)
	{
		for (int i = s.size() - 8; i < s.size(); i++)
			ans += s[i];
		return ans;
	}
	else return s;
}

void cal_1_Complement(string& s)//ham lay bu 1
{
	for (int i = 0; i < s.size(); i++)
		if (s[i] == '0') s[i] = '1';
		else s[i] = '0';
}

void cal_2_Complement(string& s)//ham lay bu 2
{
	string plus = "00000001";
	s = Add_Bit(s, plus);
}

void ConvertDECtoBIN_2Complement(int n)//ham chuyen thap phan qua nhi phan voi so am
{
	if (n >= -128 && n <= 127)
	{
		if (n < 0)
		{
			string a = ConvertDECtoBIN8bits(n);
			a = fitBits(a);
			cal_1_Complement(a);
			if (n < 0)
				cal_2_Complement(a);
			cout << a;
			cout << "\n";
		}
		else cout << ConvertDECtoBIN8bits(n);
	}
	else cout << "CAN'T CONVERT!\n";
}

int ConvertBINtoDEC(string s)//ham chuyen nhi phan sang thap phan
{
	int res = 0;
	for (int i = 1; i < 8; i++)
	{
		int tmp = s[i] - '0';
		res += (pow(2, 8 - i - 1)) * tmp;
	}
	if (s[0] - '0' == 1) res = res + (pow(-2, 7));
	return res;
}

string Multi_Bit(string& st, string& nd)//ham nhan bit
{
	int size = 8;
	string C = "0";
	string A = "00000000";
	string Q = st;
	string M = nd;
	int check1 = ConvertBINtoDEC(st);
	int check2 = ConvertBINtoDEC(nd);
	//if (check1 * check2 <= 127 && check1 * check2 >= -128)
	{
		while (size > 0)
		{
			if (Q[7] == '1' && C[0] == '0')
			{
				A = Sub_Bit(A, M);
			}
			else
				if (Q[7] == '0' && C[0] == '1')
				{
					A = Add_Bit(A, M);
				}
			//SHR
			C[0] = Q[7];
			for (int i = 7; i > 0; i--)
				Q[i] = Q[i - 1];
			Q[0] = A[7];
			for (int i = 7; i > 0; i--)
				A[i] = A[i - 1];
			size--;
		}

		string ans = "";
		ans += A;
		ans += Q;
		//ans = fixSize(ans);
		return ans;
	}
	/*else {
		cout << "\nCant Multiply!";
		return "";*/
	
}

string Div_Bit(string& st, string& nd)//ham chia bit
{
	string A = "";
	int sign = 0;

	if (st[0] == '1')
	{
		st = ConvertNegaBintoPosiBin(st);
		sign++;
	}
	if (nd[0] == '1')
	{
		nd = ConvertNegaBintoPosiBin(nd);
		sign++;
	}

	if (st[0] == '1')
		 A = "11111111";
	else  A = "00000000";
	int size = 8;
	string Q = st;
	string M = nd;
	while (size > 0)
	{
		//SHL
		for (int i = 0; i < 7; i++)
			A[i] = A[i + 1];
		A[7] = Q[0];
		for (int i = 0; i < 7; i++)
			Q[i] = Q[i + 1];
		//Q[7] = '0';
		A = Sub_Bit(A, M);
		if (A[0] == '1')
		{
			Q[7] = '0';
			A = Add_Bit(A, M);
		}
		else Q[7] = '1';
		size--;
	}
	
	if (sign == 0 || sign == 2)
	{
		cout << "\nDu: " << A << "\nThuong: ";
		return Q;
	}
	else
	{
		A = ConvertPosiBintoNegaBin(A);
		cout << "\nDu: " << A << "\nThuong: ";
		Q = ConvertPosiBintoNegaBin(Q);
		return Q;
	}
}

string ConvertNegaBintoPosiBin(string start)
{
	int tam1 = ConvertBINtoDEC(start);
	tam1 *= -1;
	string ans = ConvertDECtoBIN8bits(tam1);
	return ans;
}

string ConvertPosiBintoNegaBin(string start)
{
	int tam2 = ConvertBINtoDEC(start);
	tam2 *= -1;
	string ans = ConvertDECtoBIN8bits(tam2);
	ans = fitBits(ans);
	cal_1_Complement(ans);
	cal_2_Complement(ans);
	return ans;
}