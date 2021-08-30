Imports System.Text.RegularExpressions
Imports System.Numerics

Module Module1

    Sub Main()
        Dim file As String
        file = My.Computer.FileSystem.ReadAllText("C:\Users\hamza.DESKTOP-8DJLPME\Desktop\PostfixEvaluation.txt")

        Dim A As Double
        Dim B As Double
        Dim elements As String = ""
        Dim ops As String = "+ - * /"
        Dim result As Double
        Dim operators As String = "+"
        Dim expression As String = file

        Dim exp() As String = expression.Split(" ")
        Dim mystack As New Stack

        For Each element As String In exp

            If element = "add" Then
                A = (mystack.Pop)
                B = (mystack.Pop)
                result = CDbl(A) + CDbl(B)
                mystack.Push(result)


            ElseIf element = "sub" Then
                A = (mystack.Pop)
                B = (mystack.Pop)
                result = CDbl(B) - CDbl(A)
                mystack.Push(result)

            ElseIf element = "mul" Then
                A = (mystack.Pop)
                B = (mystack.Pop)
                result = CDbl(A) * CDbl(B)

                mystack.Push(result)


            ElseIf element = "div" Then
                A = (mystack.Pop)
                B = (mystack.Pop)

                result = CDbl(B) / CDbl(A)
                mystack.Push(result)

            ElseIf element = "mod" Then
                A = (mystack.Pop)
                B = (mystack.Pop)

                result = CDbl(B) Mod CDbl(A)
                mystack.Push(result)

            ElseIf element = "sqrt" Then
                B = mystack.Pop
                result = Math.Sqrt(B)
                mystack.Push(result)
            Else
                mystack.Push(CInt(element))
            End If
            Console.WriteLine(mystack.Peek())

        Next




        Console.ReadLine()
    End Sub


End Module