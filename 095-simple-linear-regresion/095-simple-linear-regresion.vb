Module Module1

    Sub Main()
        Dim p As String = Console.ReadLine()
        Dim x(CInt(p.Split(" ")(1)) - CInt(p.Split(" ")(0))) As Double
        Dim y(CInt(p.Split(" ")(1)) - CInt(p.Split(" ")(0))) As Double
        Dim Sumx As Double
        Dim Sumy As Double
        Dim Meanx As Double
        Dim Meany As Double
        Dim Sxx As Double
        Dim Sxy As Double
        Dim m As Double
        Dim c As Double
        For i As Integer = 0 To CInt(p.Split(" ")(1)) - CInt(p.Split(" ")(0))
            Dim inp() As String = Console.ReadLine.Split(" ")
            x(i) = CInt(inp(1))
            y(i) = CInt(inp(2))
            Sumx += x(i)
            Sumy += y(i)
        Next

        Meanx = Sumx / x.Length
        Meany = Sumy / y.Length
        For i As Integer = 0 To x.Length - 1
            Sxx += (x(i) - Meanx) ^ 2
            Sxy += (x(i) - Meanx) * (y(i) - Meany)
        Next
        m = Sxy / Sxx
        c = Meany - (m * Meanx)

        Console.WriteLine(m & " " & c)
        Console.ReadLine()


    End Sub

End Module