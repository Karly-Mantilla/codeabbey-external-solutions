Sub fifty()   'ïàëèíäðîìû

Dim N, posl, posr As Byte
Dim str As String

Sheets("50").Activate
With Sheets("50")
        
    N = Cells(1, 1).Value
        
    For i = 1 To N
        str = Cells(i + 1, 1).Value
        posl = 1
        posr = Len(str)
        Do While posr > posl
            Do While Mid(str, posl, 1) Like "[., -]"
                posl = posl + 1
            Loop
            Do While Mid(str, posr, 1) Like "[., -]"
                posr = posr - 1
            Loop
            If Mid(str, posl, 1) Like Mid(str, posr, 1) Then
                Cells(4 + N, i).Value = "Y"
            Else
                Cells(4 + N, i).Value = "N"
                Exit Do
            End If
            posl = posl + 1
            posr = posr - 1
        Loop
    Next i
       
End With

End Sub