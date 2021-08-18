Imports System.Numerics
Module Module1

    Sub Main()
        Dim N, K, ans As BigInteger
        Dim output As String = ""
        Dim Nums As Integer = Console.ReadLine()
        For i As Integer = 1 To Nums
            Dim input() As String = Console.ReadLine.Split(" ")
            N = input(0)
            K = input(1)
            ans = Factorial(N) / (Factorial(K) * Factorial(N - K))
            output &= ans.ToString & " "
        Next
        Console.WriteLine(output)
        Console.ReadLine()
    End Sub
    Function Factorial(ByVal x As Integer) As BigInteger
        Dim result As BigInteger
        If x = 0 Then
            Return 1
        End If
        result = x * Factorial(x - 1)
        Return result
    End Function
End Module