Module module29

    'pythagorean theorem 
    'http://www.codeabbey.com/index/task_view/pythagorean-theorem
    '23/02/17
    'we juggin like that 

    Sub main()
        Dim numberOfTriangles As Integer = Console.ReadLine()
        Dim triangleStore(numberOfTriangles - 1, 2) As Decimal
        Dim nextData As String

        For i As Integer = 0 To numberOfTriangles - 1
            nextData = Console.ReadLine()
            triangleStore(i, 0) = nextData.Split(" ")(0)
            triangleStore(i, 1) = nextData.Split(" ")(1)
            triangleStore(i, 2) = nextData.Split(" ")(2)
        Next

        For i As Integer = 0 To numberOfTriangles - 1
            If Math.Sqrt(triangleStore(i, 0) ^ 2 + triangleStore(i, 1) ^ 2) > triangleStore(i, 2) Then
                Console.Write("A ")
            ElseIf Math.Sqrt(triangleStore(i, 0) ^ 2 + triangleStore(i, 1) ^ 2) = triangleStore(i, 2) Then
                Console.Write("R ")
            ElseIf Math.Sqrt(triangleStore(i, 0) ^ 2 + triangleStore(i, 1) ^ 2) < triangleStore(i, 2) Then
                Console.Write("O ")
            End If
        Next
        Console.ReadLine()
    End Sub

End Module