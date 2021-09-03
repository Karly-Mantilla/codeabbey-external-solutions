/* 
Coded by errorseven @ 12/05/15
Written in AutoHotkey
http://www.autohotkey.com

Usage: Double click file scriptName.ahk to run
       values are read from contents in Clipboard 
       output is copied to into Clipboard
*/

String := StrSplit(Clipboard) ; Command Line Parameter
Loop % String.Length()
    Results .= String.pop()
Clipboard := Trim(Results)