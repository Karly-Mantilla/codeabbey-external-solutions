Module Module1

    Sub Main()
        Dim notesequence() As String = "C C# D D# E F F# G G# A A# B".Split(" ")
        Dim allnotes As New List(Of String)
        For i As Integer = 0 To notesequence.Length - 1
            For j As Integer = 1 To 5
                allnotes.Add(notesequence(i) & CStr(j))
            Next
        Next
        Dim n = Console.ReadLine()
        Dim out2 As String = ""

        Dim output As String = ""
        For i As Integer = 0 To allnotes.Count - 1
            Dim distfromA As Integer
            If allnotes(i)(1) = "#" Then
                distfromA = Array.IndexOf(notesequence, allnotes(i)(0) & allnotes(i)(1)) - 9
            Else
                distfromA = Array.IndexOf(notesequence, CStr(allnotes(i)(0))) - 9
            End If


            Dim tmp As Double
            tmp = 440 * 2 ^ (distfromA / 12)

            output &= CInt((tmp) * (2 ^ findoctavediff(allnotes(i)))) & " "
        Next

        Dim freqs(output.Trim.Split(" ").Length - 1)
        For i As Integer = 0 To freqs.Length - 1
            freqs(i) = CInt(output.Trim.Split(" ")(i))
        Next



        Dim x() As String = Console.ReadLine.Split(" ")

        Dim xdbl(x.Length - 1) As Double
        For i As Integer = 0 To xdbl.Length - 1
            xdbl(i) = CDbl(x(i))
        Next
        Dim count = 0
        For i As Integer = 0 To xdbl.Length - 1
            Dim tmpstr As New List(Of String)
            For j As Integer = 0 To allnotes.Count - 1

                If xdbl(i) >= freqs(j) - 15 And xdbl(i) <= freqs(j) + 15 Then
                    tmpstr.Add(xdbl(i) & " " & freqs(j) & " " & j)
                    count += 1
                End If

            Next

            If count > 1 Then
                out2 &= allnotes(FindClosest(tmpstr)) & " "
            ElseIf count = 1 Then
                out2 &= allnotes(CInt(tmpstr(0).Trim.Split(" ")(2))) & " "
            End If
            count = 0
        Next
        Console.WriteLine(out2.Trim)
        My.Computer.Clipboard.SetText(out2.Trim)
        Console.ReadLine()
    End Sub
    Function findoctavediff(ByVal x As String)
        Dim octave = 0
        If x(1) = "#" Then
            octave = CInt(CStr(x(2)))
        Else
            octave = CInt(CStr(x(1)))
        End If
        Return octave - 4
    End Function
    Function FindClosest(ByVal x As List(Of String))
        Dim differences As New List(Of Double)
        For i As Integer = 0 To x.Count - 1
            differences.Add(Math.Abs(CDbl(x(i).Split(" ")(0)) - CDbl(x(i).Split(" ")(1))))
        Next
        Return CDbl(x(differences.IndexOf(differences.Min)).Split(" ")(2))
    End Function
End Module