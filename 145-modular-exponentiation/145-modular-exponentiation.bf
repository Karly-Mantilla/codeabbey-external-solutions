static void Main(string[] args)
        {
            int anz = int.Parse(Console.ReadLine());
            for (int i = 0; i < anz; i++)
            {
                string[] s = Console.ReadLine().Split(' ');
                long a = long.Parse(s[0]);
                long b = long.Parse(s[1]);
                long m = long.Parse(s[2]);
                long pow = a;
                long result = 1;
                while (b > 0)
                {
                    if ((b & 1) == 1)
                        result = (result * pow) % m;
                    pow = (pow * pow) % m;
                    b >>= 1;
                }
                Console.Write(result + " ");
            }
        }