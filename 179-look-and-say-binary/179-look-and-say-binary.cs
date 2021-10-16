using System;
using System.Linq;
using System.Collections.Generic;

namespace RoutineTasks
{
    class Program
    {
        static void Main(string[] args)
        {
            string str = Console.ReadLine();
            double dist = str.Count(i => i == '1');
            List<string> temp = new List<string>() { str };
            int count = 0;
            while (temp[0] != "10")
            {
                string t = "";
                char c;
                int index = 0;
                while (index < temp.First().Length)
                {
                    c = temp.First()[index];
                    int index2 = index;
                    while (index2 < temp.First().Length && c == temp.First()[index2])
                        index2++;
                    t += Convert.ToString((index2 - index), 2);                    
                    index = index2;
                }
                temp.Add(t);
                temp.RemoveAt(0);
                count++;
            }
            Console.WriteLine(count + " " + (ulong)Math.Pow(2, dist - 1));
            Console.ReadLine();
        }
    }
}