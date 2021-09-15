  static void Main(string[] args)
        {
            int anz = int.Parse(Console.ReadLine());
            for (int i = 0; i < anz; i++)
            {
                string[] s = Console.ReadLine().Split(' ');
                int n = int.Parse(s[0]);
                int k = int.Parse(s[1]);
                bool inverted = s[2] == "i";
                if (!inverted)
                {
                    int m = n % (k + 1);
                    if (m > 0)
                        Console.Write(m + " ");
                    else
                        Console.Write("0 ");
                }
                else
                {
                    int m = (n - 1) % (k + 1);
                    if (m > 0)
                        Console.Write(m + " ");
                    else
                        Console.Write("0 ");
                }
            }
        }