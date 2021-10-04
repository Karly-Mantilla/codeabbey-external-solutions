using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace duelChances
{
    class Program
    {
        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine());

            for (int i = 0; i < n; i++)
            {
                string buffer = Console.ReadLine();
                string[] container = buffer.Split(' ');

                double firstPlayerChanceToKill = double.Parse(container[0]) / 100;
                double secondPlayerChanceToKill = double.Parse(container[1]) / 100;

                double firstPlayerChanceToDie = 1 - firstPlayerChanceToKill;
                double secondPlayerChanceToDie = 1 - secondPlayerChanceToKill;

                double result = (firstPlayerChanceToKill / (1.0 - firstPlayerChanceToDie * secondPlayerChanceToDie)) * 100;
                result = Math.Round(result);
                Console.Write(result + " ");
            }
        }
    }
}