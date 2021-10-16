using System;



namespace ConsoleApp1
{
    class Program
    {
        static void Main()

        {
            
            int n = int.Parse(Console.ReadLine());
            ulong[] a = new ulong[n];
            string[] Num;
            int i = 0;

            Num = Console.ReadLine().Split(' ');

            foreach (var item in Num)
            {
                a[i] = ulong.Parse(item);
                i++;
            }


            Console.WriteLine(WorkBeach(a, n));




        
            Console.ReadKey();

        }


        static ulong WorkBeach (ulong[] g, int n)
        {
            ulong res = 0;

            for (int i = 0; i < n; i++)
            {
                res = (res + g[i]) * 113 % 10000007;
                
            }

            return res;
        }

    }
}

 