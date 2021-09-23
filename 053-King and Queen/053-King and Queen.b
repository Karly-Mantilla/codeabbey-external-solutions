using System;
using System.IO;

namespace KingAndQueen
{
    class Program
    {
        static void Main(string[] args)
        {
            // по диагонали ходы королевы сдвиг и буквы и цифры
            StreamReader sr = new StreamReader("data.txt");
            sr.ReadLine();
            string[,] board = new string[8, 8];
            string[] data;
            char[] King;
            char[] Queen;
            while (!sr.EndOfStream)
            {
                data = sr.ReadLine().Split(" ");

                King = data[0].ToCharArray();
                Queen = data[1].ToCharArray();
                isTaken(King, Queen);

            }
            
            void isTaken(char[] kingPos, char[] queenPos)
            {
                int kPos1 = letterToNum(kingPos[0]);
                int qPos1 = letterToNum(queenPos[0]);
                int kPos2 = (int)Char.GetNumericValue(kingPos[1]);
                int qPos2 = (int)Char.GetNumericValue(queenPos[1]);

                //по вертикали
                if (kPos1 == qPos1)
                {
                    Console.Write("Y ");
                    return;
                }
                // по горизонтали
                if (kPos2 == qPos2)
                {
                    Console.Write("Y ");
                    return;
                }

                if (Math.Abs(kPos1 - qPos1) == Math.Abs(kPos2 - qPos2))
                {
                    Console.Write("Y ");
                    return;
                }


                else Console.Write("N ");
                
            }

            int letterToNum(char letter)
            {
                if (letter == 'a')
                {
                    return 1;
                }
                if (letter == 'b')
                {
                    return 2;
                }
                if (letter == 'c')
                {
                    return 3;
                }
                if (letter == 'd')
                {
                    return 4;
                }
                if (letter == 'e')
                {
                    return 5;
                }
                if (letter == 'f')
                {
                    return 6;
                }
                if (letter == 'g')
                {
                    return 7;
                }
                else 
                {
                    return 8;
                }
            }

                sr.Close();
            Console.ReadKey();
        }
       
    }
}