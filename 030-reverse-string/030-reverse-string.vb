Option Strict On
Option Explicit On

Imports System.IO
Imports System.Configuration
Imports System.Numerics
'Problem 30: Reverse string

Module Problem30

    Sub Main()
        Const prob_no As Integer = 30
        Dim path As String = ConfigurationManager.AppSettings("FilePath") & prob_no.ToString & ".txt"
        Dim sr As StreamReader = New StreamReader(path)

        '        Dim numOfEntries As String = sr.ReadLine
        'Dim line As String = String.Empty
        Dim results As String = String.Empty
        sr.Peek()

        Dim line() As Char = sr.ReadLine.ToCharArray
        results = strReverse(line)

        'For i As Integer = 1 To CInt(numOfEntries)
        '    line = sr.ReadLine
        '    results &= calcChkSum(line)
        'Next

        results = results.Trim(" "c)

        Console.WriteLine("Answer: " & results)
        Console.ReadLine()

    End Sub

    Private Function strReverse(ByVal strLine() As Char) As String
        Dim res As String = String.Empty
        Dim ub As Integer = strLine.GetUpperBound(0)
        Dim i As Integer = 0

        For i = ub To 0 Step -1
            res &= strLine(i).ToString
        Next

        Return res


    End Function

End Module