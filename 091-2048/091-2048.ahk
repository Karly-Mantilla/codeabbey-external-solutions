/* 
Coded by errorseven @ 10/18/2019
Written in AutoHotkey
http://www.autohotkey.com
*/

input := clipboard
board := []

Loop, parse, input, `n, `r
{
    if (A_index != 5) {
        board.push(StrSplit(A_loopField, " "))
        }
    else
        for e, dir in StrSplit(A_loopField, " ")
            board := updateBoard(board, dir)
}

MsgBox % clipboard:=Trim(getValues(board))

getValues(board) {    
    values := {2: 0}    
    for e, obj in board 
        for k, v in obj {
            if (values[v])
                values[v]++
            else if (v >= 2)
                values[v] := 1
        }
    i := 2
    loop % values.count()
        results .= values[i] " ", i := i*2
    return results
}

updateBoard(board, dir) {
    
    if (dir == "L") {
        loop % 4 {
            col := A_index, i := 1
            loop % 4 {
                
                if (board[col][i] == "")
                    board[col].RemoveAt(i--), board[col].Push("")                    
                i++
            }
            loop % 4 {
                row := A_index
                if (board[col][row] == board[col][row+1] and board[col][row] != "")
                    board[col][row] += board[col][row+1], board[col].RemoveAt(row+1), board[col].Push("")
            }
        }
    }
    
    if (dir == "R") {
        
        loop % 4 {
            col := A_index, i := 4
            loop % 4 {
                If (board[col][i] == "") 
                    board[col].RemoveAt(i++), board[col].InsertAt(1, "")
                i--    
            }
            
            loop % 4 {
                row := 5 - A_index
                if (board[col][row] == board[col][row-1] and board[col][row] != "")
                    board[col][row] += board[col][row-1], board[col].RemoveAt(row-1), board[col].InsertAt(1, "")
            }
        }
    }
    
    if (dir == "U") {
        
        loop % 4 {
            row := A_index
            tempArr := []
        
            loop % 4 { ; Create Temp Array
                col := A_index
                tempArr.push(board[col][row])
            }
                     
            i := 1
            loop % 4 {       
                if (tempArr[i] == "")
                    tempArr.RemoveAt(i--), tempArr.Push("")                    
                i++
            }
            loop % 4 {
                r := A_index
                if (tempArr[r] == tempArr[r+1] and tempArr[r] != "")
                    tempArr[r] += tempArr[r+1], tempArr.RemoveAt(r+1), tempArr.Push("")
            }
        
            loop % 4 { ; Update Board from Temp Array
                col := A_Index
                board[col][row] := tempArr[col]
            }
        }
    }
    
    if (dir == "D") {
        
        loop % 4 {
            row := A_index
            tempArr := []
        
            loop % 4 { ; Create Temp Array
                col := A_index
                tempArr.push(board[col][row])
            }
                     
            i := 4
            loop % 4 {
                If (tempArr[i] == "") 
                    tempArr.RemoveAt(i++), tempArr.InsertAt(1, "")
                i--    
            }
            
            loop % 4 {
                r := 5 - A_index
                if (tempArr[r] == tempArr[r-1] and tempArr[r] != "")
                    tempArr[r] += tempArr[r-1], tempArr.RemoveAt(r-1), tempArr.InsertAt(1, "")
            }
        
            loop % 4 { ; Update Board from Temp Array
                col := A_Index
                board[col][row] := tempArr[col]
            }
        }
    }
    
    return board
}
