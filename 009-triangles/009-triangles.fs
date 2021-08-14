open System.IO


let checkTriangle (n: int list) =
    if n.[0] + n.[1] > n.[2] && n.[1] + n.[2] > n.[0] && n.[0] + n.[2] > n.[1] then 1 
    else 0


let lines = File.ReadLines("C:\Users\wintermute\Documents\Visual Studio 2015\Projects\Codeabbey\Codeabbey\input.txt")
for line in lines do
    line.Split() |> Seq.map int |> Seq.toList |> fun x -> printf "%i " (checkTriangle x)
let x = System.Console.ReadLine()