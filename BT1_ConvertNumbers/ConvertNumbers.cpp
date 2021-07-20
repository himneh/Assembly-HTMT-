
#include "SupeLib.h"

int main()
{
    int n;
    //Convert DEC to BIN
    cout << "Give DEC: ";
    cin >> n;
    cout << "\nDEC to BIN: ";
    cout << ConvertDECtoBIN(n);

    //Convert DEC to HEX
    cout << "\nGive DEC: ";
    cin >> n;
    vector<char> a;
    a = ConvertDECtoHEX(n);
    cout << "\nDECtoHEX: ";
    for (int i = a.size() - 1; i >= 0; i--)
        cout << a[i];

    //covert BIN to DEC
    cout << "\nGive BIN: ";
    cin >> n;
    int ans = ConvertNums(n, 2);
    cout << "\nBINtoDEC: ";
    cout << ans;

    //convert HEX to DEC
    cout << "\nGive HEX: ";
    string s;
    cin >> s;
    cout << "\nHEXtoDEC: ";
    cout << ConvertHEXtoDEC(s);

    //convert BIN to HEX
    cout << "\nGive BIN: ";
    cin >> s;
    cout << "\nBINtoHEX: ";
    string skq = ConvertBINtoHEX(s);
    cout << skq;
    
    return 0;
}
