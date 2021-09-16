
open System
open System.IO

[<EntryPoint>]
let main argv =
    let lines = File.ReadAllLines("Input.txt")
    // split strings and convert to floats
    let input = Array.map (fun (s:string) -> s.Split(' ')) lines.[1..] |> Array.map (fun arr -> Array.map float arr)
    
    let computeArea (entry:float[]) =        
        let x1 = entry.[0]
        let y1 = entry.[1]
        let x2 = entry.[2]
        let y2 = entry.[3]
        let x3 = entry.[4]
        let y3 = entry.[5]
        let a = Operators.sqrt((x1-x2)**2.0 + (y1-y2)**2.0)
        let b = Operators.sqrt((x2-x3)**2.0 + (y2-y3)**2.0)
        let c = Operators.sqrt((x3-x1)**2.0 + (y3-y1)**2.0)
        let s = (a+b+c)/2.0
        Operators.sqrt (s*(s-a)*(s-b)*(s-c))

    Array.iter (fun i -> printfn "%.2f" (computeArea i)) input
        
    0
    