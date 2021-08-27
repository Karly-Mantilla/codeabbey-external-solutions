using System;



namespace ConsoleApp1
{
    class Program
    {
        static void Main()

        {
            int n = int.Parse(Console.ReadLine());
            double[] res = new double[n];
            

            for (int i = 0; i < n; i++)
            {
                double[] a = new double[2];
                string[] Num;
                int k = 0;
                Num = Console.ReadLine().Split(' ');

                foreach (var item in Num)
                {
                    a[k] = double.Parse(item);
                    k++;
                }

                res[i] = Babylonian(a[0], a[1]);

            }

            WriteMass(res, n);
          




        
            Console.ReadKey();

        }


        static double Babylonian (double v, double m)
        {
           
            double r = 1;
            double d;
            for (int i = 0; i < m; i++)
            {
                d = v / r;

                r = (r + d) / 2;
            }

            return r;
         
            
        }

        static void WriteMass (double[] l, int n)
        {
            for (int i = 0; i < n; i++)
            {
                Console.Write(Math.Round(l[i], 9) + " ");
            }
        }



    }
}
