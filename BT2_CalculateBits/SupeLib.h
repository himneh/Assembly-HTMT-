#pragma once
#include <iostream>
#include <string>

using namespace std;

string ConvertDECtoBIN8bits(int k);

string fitBits(string s);


void cal_1_Complement(string& s);

string Add_Bit(string st, string nd);

void cal_2_Complement(string& s);

void ConvertDECtoBIN_2Complement(int n);

int ConvertBINtoDEC(string s);

string Sub_Bit(string st, string nd);

string fixSize(string s);

string Multi_Bit(string& st, string& nd);

string Div_Bit(string& st, string& nd);


string ConvertNegaBintoPosiBin(string start);

string ConvertPosiBintoNegaBin(string start);
