 static public string task171(string Input)
        {
            string Output = "";
            Regex inputPtrn = new Regex(@"(\d+) (\d+,\d+)");
            double D = 0, A = 0;
            foreach (Match tree in inputPtrn.Matches(Input.Replace('.', ',')))
            {
                D = Convert.ToDouble(tree.Groups[1].Value);
                A = Convert.ToDouble(tree.Groups[2].Value) % 90;
                Output += Math.Round(D * Math.Tan(A * Math.PI / 180)) + " ";
            }
            return Output;
        }