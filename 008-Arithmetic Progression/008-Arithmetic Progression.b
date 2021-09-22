namespace FirstApp
{
    class Program
    {
        static void Main(string[] args)
        {

            int[,] str = new int[10,3]
                {
                 { 23 ,13 ,77 },
{ 9, 20, 90 },
{ 1, 4, 92 },
{ 18, 20, 100 },
{ 20, 8, 71 },
{ 8, 16, 10 },
{ 21, 12, 42 },
{ 11, 18, 57 },
{ 1, 12, 54 },
{ 20, 4, 77 },
                };
            int rows = str.GetUpperBound(0) + 1;
            

            for (int i = 0; i < rows; i++)
                {
                int count = str[i,0];
                int y = 1;
                for (int j = 0; j < str[i, 2]-1; j++)
                {
                   
                    int x = str[i, 0] + str[i, 1] * y;
                    y++;
                    count = count + x;
                    
                }
                Console.Write($"{count} ");


            }

            Console.ReadKey();

        }
             
            
        }
    }