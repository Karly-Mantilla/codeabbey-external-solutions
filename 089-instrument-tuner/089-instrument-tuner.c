#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    cout.precision(8);
    int n;
    cin>>n;
    
    string notes[12] = {"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"};
    int hz[12][12];
    
    double step = (440/8) / pow(2.0,10.0/12.0); //30.8677063285... ~ first note 1C

    for(int i=0; i<12;i++)
    {
        for(int j=0; j<12;j++)
    {
       
        hz[i][j] = round (pow(2,i) * step * pow(pow(2.0,1.0/12.0),j+1) );
    }
    }
    
    for(int i=0; i<n; i++)
    {
        double a;
        cin>>a;
        
        bool found = false;
        
        for(int oct=0;oct<12 && !found;oct++)
        {
            for(int note=0; note<12 && !found;note++)
            {
                if(hz[oct][note] > a)
                {
                    found = true;
                    double d1 = hz[oct][note]- a;
                    
                    double d2;
                    if(note-1 >=0)
                    {
                        d2 = a - hz[oct][note-1];
                    }
                    else
                    {
                        d2 =  a - hz[oct-1][11];
                    }
//cout<<d1<<"     "<<d2<<"    ";
                    
                    if(d1<=d2)
                    {
                        cout<<notes[note]<<oct+1<<" ";
                    }
                    else
                    {
                        if(note-1 >=0)
                        {
                            cout<<notes[note-1]<<oct+1<<" ";
                        }
                        else
                        {
                           cout<<notes[11]<<oct<<" "; 
                        }
                    }
                }
            }
        }
    }
}