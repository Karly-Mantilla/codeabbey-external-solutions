using System;
using System.Linq;

class YachtOrDicePoker
{
    static void Main(string[] args)
    {
        int n = Convert.ToInt32(Console.ReadLine());
        string[] results = new string[n];
        for (int i = 0; i < n; i++)
        {
            int[] array = Console.ReadLine().Split().Select(int.Parse).ToArray();
            results[i] = ProcessArray(array);
        }
        Console.WriteLine(string.Join(" ", results));
    }

    static string ProcessArray(int[] array)
    {
        int numOfTwos = 0,
            numOfThrees = 0,
            smallStraight = 0,
            bigStraight = 0;
        int[] positions = new int[6];
        for (int i = 0; i < 5; i++)
            positions[array[i] - 1]++;
        for (int i = 0; i < 6; i++)
        {
            if (positions[i] == 5)
                return "yacht";
            else if (positions[i] == 4)
                return "four";
            else if (positions[i] == 2)
                numOfTwos++;
            else if (positions[i] == 3)
                numOfThrees++;
            if (i > 0 && positions[i] != 0)
                bigStraight++;
            if (i < 5 && positions[i] != 0)
                smallStraight++;
        }
        if (numOfTwos == 2)
            return "two-pairs";
        else if (numOfTwos == 1 && numOfThrees == 1)
            return "full-house";
        else if (numOfTwos == 1)
            return "pair";
        else if (numOfThrees == 1)
            return "three";
        else if (smallStraight == 5)
            return "small-straight";
        else if (bigStraight == 5)
            return "big-straight";
        else
            return "none";
    }
}