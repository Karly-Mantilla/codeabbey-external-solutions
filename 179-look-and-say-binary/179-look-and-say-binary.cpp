#include<iostream>
#include <bitset>
#include <string>
#include <math.h>
#include <iomanip>

using namespace std;

void look_say(string val){
    int step=0;
    unsigned long long int ones=0;
    while(val!="10"){
        string res1,str1; int j=0,d=1;
        while(val[j]!='\0'){
            int n=1;
            while(val[j+1]==val[j]){
                n++;
                j++;
            }
            if((step==0)&&(d%2==1)){
                ones+=n;
            }
            str1=bitset<4>(n).to_string();
            while(str1[0]=='0'){
                str1.erase(0,1);
            }
            j++; res1+=str1; d++;
        }
        val=res1; step++;
    }
    cout<<fixed<<setprecision(0)<<step<<' '<<pow(2,ones-1)<<' ';
}

int main(void){
    char val[150];
    cin>>val;
    look_say(val);
}