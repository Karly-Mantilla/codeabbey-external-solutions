#include <fstream>
#include <cmath>

using namespace std;

ifstream fin(".in");
ofstream fout(".out");

int a,n,i,j,k,l,v[1000],nrs,nrp;
bool b;

int main()
{
    fin >> n;

    for(i = 1; i <= n; ++i)
        {
            fin >> a;

            k = a;



            while(a != v[j - 1])
                {
                    a*=a;

                    a/=100;
                    a%=10000;

                    ++j;
                    v[j] = a;
                    if(a == k)
                        break;
                    for(l = 1; l < j; ++l)
                        if(a == v[l])
                            {
                                b = 1;
                                break;
                            }
                    if(b)
                        break;

                }
            fout << j << " ";
            j = v[1] = b =0;
        }

    return 0;
}