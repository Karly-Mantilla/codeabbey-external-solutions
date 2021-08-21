namespace codeabbey075.YachtOrDicePoker

module MainProgram =

  open System
  open System.IO


  ///Setting `validateFile` to `true` if the file exists and has the .lst format
  let private validateFile (path : string[])= 
    let file = path.[0]
    if not <| File.Exists(file)  then 
        printfn "File doesn't exist %s" file
        printfn "\n<file.lst>  Expected argument"
        false
      else 
        if ( file.Split('.') |> (fun x -> x.[1]<>"lst")) then
          printfn "Invalid format \"%s\"" file
          printfn "\n<file.lst>  Expected argument"
          false
        else 
          true

  ///reading the lines of the input file
  let private getListInputData (argv : String[]) = 
    let tmpFile = Path.Combine(__SOURCE_DIRECTORY__, argv.[0])
    let linesFile = File.ReadAllLines(tmpFile) |> Array.toList;
    linesFile
  
  ///Printing the input list
  let private printListInput (list : String list) = 
    printfn "\nInput:" 
    list |> List.iter (printfn "%s")
    printfn "" 
    list.Tail

  //Split a string into sort array of integers
  let private diceRollStringToSortDiceRollArray( diceRollString : String) = 
    let diceRoll = diceRollString.Split(' ') |> Array.map System.Int32.Parse |> Array.sortBy (fun x -> x)
    diceRoll


  //Converting a string list to a array list
  let private stringListToSortDiceRollList (listString : String list) = 
    List.collect (fun x -> [diceRollStringToSortDiceRollArray x] ) listString

  let private validate (listSort : int[]) = 

    let outputOtherCases (arr : int[] ) =
      match arr with
      | [|2;1;_;_;_;_|] -> ["pair"]
      | [|3;1;_;_;_;_|] -> ["three"]
      | [|4;1;_;_;_;_|] -> ["four"]
      | [|5;0;_;_;_;_|] -> ["yacht"]
      | [|2;2;_;_;_;_|] -> ["two-pairs"]
      | [|3;2;_;_;_;_|] -> ["full-house"]
      | _ -> ["none"]

 
    let otherCase arr =
      let countArray = [|0;0;0;0;0;0|]
      Array.iter (fun x -> countArray.[x-1] <- countArray.[x-1]+1) arr
      outputOtherCases <| Array.sortBy (fun x -> -x) countArray

    match listSort with
    | [|1;2;3;4;5|] -> ["small-straight"]
    | [|2;3;4;5;6|] -> ["big-straight"]
    | case -> otherCase case

  ///printing result
  let private Result list= 
    printfn "Ouput:"
    list
    |> List.collect validate 
    |> List.iter (printf "%s ")
    printfn ""

  [<EntryPoint>]
  let main argv = 
     
    //validating argument
    let validatedFile = argv |> validateFile

    //if the argument is valid print result for the input file
    if validatedFile then
      getListInputData argv
      |> printListInput
      |> stringListToSortDiceRollList
      |> Result

    0
