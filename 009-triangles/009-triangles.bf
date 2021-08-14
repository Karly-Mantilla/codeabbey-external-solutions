using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine());
            String s,str="",nstr;
            String[] chi; 
            int a, b, c, k;

            for (int i = 0; i < n; i++)
            {
                nstr = str;
                s= Console.ReadLine();
                chi=  s.Split(new char[]{ ' ' });
                a = int.Parse(chi[0]);
                b = int.Parse(chi[1]);
                c = int.Parse(chi[2]);
                if (a + b > c)
                    if (a + c > b)
                        if (b + c > a) k = 1;
                        else k = 0;
                    else k = 0;
                else k = 0;
                       
                            str = nstr + k + " ";

            }
            
            

            Console.WriteLine("   "); Console.WriteLine("   "); Console.WriteLine("   ");

            Console.WriteLine(str);
        }
    }
}