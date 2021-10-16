#include <fstream>
#include <cmath>

using namespace std;

ifstream fin(".in");
ofstream fout(".out");

int n,i,a,d;
double c,e,f,s,nr;

int main()
{
    fin >> n;


    for(i = 1; i <= n ; ++i)
        {
            fin >> a;

            a -= 32;
            c =a / 1.8;


            d = c;

            f = c - d;

            e = abs(f);

            if(c > 0)
                {
                    if(e < 0.5 )
                        fout << d << " ";
                    else fout << d + 1 << " ";
                }
            else{
                    if( e < 0.5 )
                        fout <<d << " ";
                    else fout << d - 1 << " ";
                }

        }

    return 0;
}