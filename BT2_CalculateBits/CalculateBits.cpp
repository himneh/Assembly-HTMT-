//19120583
#include "SupeLib.h"

int main()
{
    int n;
    cout << "Nhap so thap phan: ";
    cin >> n;
    cout << "Chuyen qua he nhi phan: ";
    ConvertDECtoBIN_2Complement(n);

    string s;
    cout << "\nNhap so nhi phan: ";
    cin >> s;
    cout << "Chuyen qua he thap phan: ";
    cout << ConvertBINtoDEC(s); 

    string s1, s2;
    cout << "\nNhap 2 so nhi phan: ";
    cin >> s1;
    cin >> s2;
    cout << "Tong: ";
    cout << Add_Bit(s1, s2);
    cout << "\nHieu: ";
    cout << Sub_Bit(s1,s2);
    cout << "\nTich: ";
    cout << Multi_Bit(s1,s2);
    //cout << "\nThuong: ";
    cout << Div_Bit(s1, s2);

    return 0;
}
