        static void Main(string[] args)
        {

            CodeAbbey Problem26 = new CodeAbbey(@"c:\tmp\problem26.txt");

            foreach(double [] line in Problem26.Data)
            {

                double number1 = line[0];
                double number2 = line[1];

                double gcd = new double();

                if (number1 > number2)
                {
                    double tgcd = number1;

                    while(!(number1% tgcd == 0 && number2% tgcd == 0))
                    {
                        tgcd--;
                    }

                    gcd = tgcd;

                }
                else if (number2 > number1)
                {
                    double tgcd = number2;

                    while (!(number1 % tgcd == 0 && number2 % tgcd == 0))
                    {
                        tgcd--;
                    }

                    gcd = tgcd;

                }

                double lcm = number1 * number2 / gcd;

                Console.Write("(" + gcd + " " + lcm + ") ");

            }

            Console.ReadLine();

        }