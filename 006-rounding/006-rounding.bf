using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _6
{
    class Program
    {
        static void Main(string[] args)
        {
            string enter = "";
            int R = int.Parse(Console.ReadLine());
            for (int i = 0; i < R; i++)
            {
                string[] str = Console.ReadLine().Split(' ');
                int q = int.Parse(str[0]);
                int w = int.Parse(str[1]);
                double n = (double)q / (double)w;
                int m = (int)n;

                if (n > 0)
                {
                    double p = Math.Abs(m - n);
                    if (p < 0.5)
                        enter += m + " ";
                    if (p >= 0.5)
                    {
                        int l = m + 1;
                        enter += l + " ";
                    }
                }
                if (n < 0)
                {
                    double p = Math.Abs(n - m);
                    if (p < 0.5)
                        enter += m + " ";
                    if (p >= 0.5)
                    {
                        int l = m - 1;
                        enter += l + " ";
                    }
                }

            }
            Console.WriteLine(enter);
            Console.ReadKey();
        }
    }
}