        Dim counter As Integer = 0
        Dim input As Integer
        Dim current As String = " "
        Dim final As String = ""

        Console.WriteLine("Input data:")
        input = Console.ReadLine()

        For i As Integer = 0 To input - 1
            current = Console.ReadLine()
            For y As Integer = 0 To current.Length - 1
                If current(y) = "a" Or current(y) = "e" Or current(y) = "i" Or current(y) = "o" Or current(y) = "u" Or current(y) = "y" Then
                    counter = counter + 1
                End If
            Next
            final = final + CStr(counter) + " "
            counter = 0
        Next

        Console.WriteLine(final)
        Console.ReadLine()