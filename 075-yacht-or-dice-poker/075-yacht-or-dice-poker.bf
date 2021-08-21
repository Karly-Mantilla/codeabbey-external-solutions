static void Main(string[] args)
        {
            int anz = int.Parse(Console.ReadLine());
            for (int i = 0; i < anz; i++)
            {
                string[] s = Console.ReadLine().Split(' ');
                int[] d = new int[5];
                for (int j = 0; j < 5; j++)
                    d[j] = int.Parse(s[j]);
                Array.Sort(d);
                bool straight = true;
                for (int j = 1; j < 5; j++)
                    if (d[j - 1] + 1 != d[j])
                        straight = false;
                if (straight)
                {
                    if (d[0] == 1)
                        Console.Write("small-straight ");
                    else
                        Console.Write("big-straight ");
                    continue;
                }
                int last = d[0];
                int same = 1;
                List<int> all = new List<int>();
                for (int j = 1; j < 5; j++)
                {
                    if (last == d[j])
                        same++;
                    else
                    {
                        if (same > 1)
                            all.Add(same);
                        same = 1;
                        last = d[j];
                    }
                }
                if (same > 1)
                    all.Add(same);
                all.Sort();
                string r = "";
                foreach (int k in all)
                    r += k;
                switch (r)
                {
                    case "2": Console.Write("pair "); break;
                    case "3": Console.Write("three "); break;
                    case "4": Console.Write("four "); break;
                    case "5": Console.Write("yacht "); break;
                    case "22": Console.Write("two-pairs "); break;
                    case "23": Console.Write("fullhouse "); break;
                    default: Console.Write("none "); break;
                }

            }
        }