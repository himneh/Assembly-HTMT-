#include "SupeLib.h"

int ConvertDECtoBIN(int k)
{
	int dec = k;
	int tmp = 0;
	int i = 1;
	long int res = 0;
	do
	{
		tmp = dec % 2;
		res += (i * tmp);
		dec /= 2;
		i *= 10;
	} while (dec > 0);
	return res;
}

vector<char> ConvertDECtoHEX(int k)
{
	int dec = k;
	vector<char> res;
	int i = 0;
	while (dec > 0)
	{
		int tmp = 0;
		tmp = dec % 16;
		if (tmp < 10)
			res.push_back(tmp + 48);
		else res.push_back(tmp + 55);
		i++;
		dec /= 16;
	}
	return res;
}

int ConvertNums(int k, int q)
{
	int give = k;
	int tmp = 1;
	int i = 0;
	int res = 0;
	while (give > 0)
	{
		tmp = give % 10;
		res += (pow(q, i)*tmp);
		i++;
		give /= 10;
	}
	return res;
}

int ConvertHEXtoDEC(string s)
{
	int size = s.size();

	int temp = 1;
	int res = 0;
	for (int i = size - 1; i >= 0; i--)
	{
		if (s[i] >= '0' && s[i] <= '9')
			res += ((s[i] - 48) * temp);
		else res += ((s[i] - 55) * temp);
		temp *= 16;
	}
	return res;
}

string ConvertBINtoHEX(string s)
{
	int size = s.size();
	string s2 = "";
	for (int i = 0; i < s.size(); i++)
		s2 += s[i];

	/// <summary>
	/// Phan code sau dùng để fill các code sao cho đủ các cặp 4bits
	/// </summary>
	/// <param name="s2"></param>
	/// <returns><s2 sau khi gan = uwu thì sẽ là 1 dãy đủ cặp 4bits, vd: 100 => 0100>
	if (size % 4 != 0)
	{
		string uwu = "";
		for (int i = 0; i < (4 - size % 4); i++)
			uwu += '0';
		uwu += s2;
		s2 = uwu;
	}
	
	string ans;
	for (int i = 0; i < s2.size(); i += 4)
	{
		string tam = "";
		for (int j = i; j < i + 4; j++)
			tam += s2[j];
		if (tam == "0000") ans += '0';
		if (tam == "0001") ans += '1';
		if (tam == "0010") ans += '2';
		if (tam == "0011") ans += '3';
		if (tam == "0100") ans += '4';
		if (tam == "0101") ans += '5';
		if (tam == "0110") ans += '6';
		if (tam == "0111") ans += '7';
		if (tam == "1000") ans += '8';
		if (tam == "1001") ans += '9';
		if (tam == "1010") ans += 'A';
		if (tam == "1011") ans += 'B';
		if (tam == "1100") ans += 'C';
		if (tam == "1101") ans += 'D';
		if (tam == "1110") ans += 'E'; 
		if (tam == "1111") ans += 'F';
	}
	return ans;
}