using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine());
            int[] a = new int[n];
            int[] b = new int[n];
            int[] d = new int[n];
            int[] c= new int[n];
            string[] chi = new string[3];

            for (int i = 0; i < n; i++)
            {
                String s = Console.ReadLine();
                chi = s.Split(new char[]{ ' ' });
              //  Console.WriteLine(chi[1]);
                a[i] = int.Parse(chi[0]);
                b[i] = int.Parse(chi[1]);
                d[i] = int.Parse(chi[2]);
                if (a[i] < b[i])
                    if (a[i] < d[i]) c[i] = a[i];
                    else c[i] = d[i];
                else if (b[i] < d[i]) c[i] = b[i];
                else c[i] = d[i];


            }




            Console.WriteLine("   "); Console.WriteLine("   "); Console.WriteLine("   ");

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine(c[i]);
            }

            
        }
    }
}