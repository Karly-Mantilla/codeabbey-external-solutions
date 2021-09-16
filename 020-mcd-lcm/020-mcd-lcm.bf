namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
           
            StreamReader sr = new StreamReader("input.txt");
            StreamWriter sw = new StreamWriter("output.txt");
            int lcm = 0;
            int gcd = 0;

            int num = Convert.ToInt32(sr.ReadLine());
            for (int i = 0; i < num; i++)
            {
                string[] arr = sr.ReadLine().Split(' ');
                int num1 = Convert.ToInt32(arr[0]);
                int num2 = Convert.ToInt32(arr[1]);

                int temp1 = num1;
                int temp2 = num2;

                while (num1 != num2)
                {
                    if (num1 > num2)
                    {
                        num1-=num2;
                    }
                    else if (num2 > num1)
                    {
                        num2-=num1;
                    }
                    
                    gcd = num1;                    
                }
                
                lcm = temp1*temp2/gcd;
                
                sw.WriteLine( "(" +gcd + " " + lcm + ")");

                

            }
            sr.Close();
            sw.Close();
        }

        
    }
}