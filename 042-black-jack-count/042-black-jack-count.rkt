#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force


Gui, add, edit, vinputStr w300 h50
Gui, add, button, x10 gAddNums Default, OK 
Gui, Show
return

GuiClose:
ExitApp

AddNums:
    Gui, submit
    inputArr := StrSplit(inputStr, "`n")
    inputArr.Remove(1)    ; Remove the first line, which is the first number

    answerArr := []
    answerStr := ""
    
    For each, numLine in inputArr
    {
        numArr := StrSplit(numLine, A_Space)
        r := 1
        X := numArr[1]
        N := numArr[2]
        
        Loop % N
        {
            d:= X / r
            r:= (d+r)/2
        }
        
        answerarr.Push(r)
    }

For each, num in answerArr 
{
        answerStr .= num . " "
}

Gui, 2: add, edit, , %answerStr%
Gui, 2: show
    

