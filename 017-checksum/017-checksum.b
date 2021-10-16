int main() {

    long long int a, c, d;
    float b;
    cin >> a;
    long int* M = new long int [a] ;
    


    c = 0;
    for (int i = 0; i < a; i++) {
        cin >> M[i];
        c += M[i];
        c *= 113;
        c %= 10000007;
    }
    
   

    cout << c;