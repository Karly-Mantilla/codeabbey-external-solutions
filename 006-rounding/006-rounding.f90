#SingleInstance Force
#Warn
code_abbey.input_box()          ; Runs user input box
Return

*Esc::ExitApp                   ; Emergency killswitch

Class code_abbey
{
    Static hwnd := {}           ; Stores all gui handles
    Static ws   := " `t`r`n"    ; Whitespace
    
    ; Creates multi-line input box
    input_box() {
        Local
        ; GUI size properties
        hwnd   := ""
        edit_w := 400
        edit_h := 300
        btn_w  := 100
        btn_h  := 25
        btn_x  := edit_w - btn_w
        
        Gui, CIB:New,                                                       ; New gui
            this.hwnd.gui := hwnd
        Gui, Margin, 5, 5
        Gui, Add, Edit, xm ym w%edit_w% h%edit_h% +Multi HWNDhwnd           ; Add large edit box for pasting multiple case sets
            this.hwnd.edit := hwnd
        Gui, Add, Button, xm y+m w%btn_w% h%btn_h% HWNDhwnd, Submit         ; Submit button
            this.hwnd.btn_submit := hwnd
            bf := ObjBindMethod(this, "Submit")
            GuiControl, +g, % hwnd, % bf
        Gui, Add, Button, xm+%btn_x% yp w%btn_w% h%btn_h% HWNDhwnd, Cancel  ; Cancel button
            this.hwnd.btn_cancel := hwnd
            bf := ObjBindMethod(this, "Quit")
            GuiControl, +g, % hwnd, % bf
        Gui, Show, AutoSize
        
        Return
    }
    
    ; Submits data to be verified and operated on
    Submit() {
        Local
        GuiControlGet, data,, % this.hwnd.edit                      ; Get data
        GuiControl,, % this.hwnd.edit, % ""                         ; Empty data box
        
        case_arr := StrSplit(Trim(data, this.ws), "`n", "`r")       ; Put each line in an elemy of the data array
        case_total := case_arr.1                                    ; Save first line to total_cases
        case_arr.RemoveAt(1)                                        ; Remove first line leaving only the cases
        
        this.check(case_total, case_arr)                            ; Verify data and check for errors
        result := this.rounding(case_arr)                           ; Assign result
        
        MsgBox, 0x4, Finished, % "Save results to the clipboard?"
            . "`n`nResults:`n" result
        IfMsgBox, Yes
            Clipboard := result
        ExitApp
    }
    
    ; Validate input
    Check(total, cases) {
        Local
        
        If (total != cases.MaxIndex())                                              ; Verify that first line matches total number of cases
            this.error("Case total number does not match actual total of cases"
                . "`nCase total (First line): " total
                . "`nActual number of cases: " cases.MaxIndex() )
        For index, value in cases                                                   ; Verify each case has 2 numbers separated by a space
            Loop, Parse, % value, % " "
                If !(this.is_num(A_LoopField))
                    this.error("All cases must consist of 2 numbers separated by a space."
                        . "`nEx: 10 25`n99.5 0.5`n1 8000000")
        
        Return True
    }
    
    ; Divide 2 numbers and round to nearest int
    rounding(case_arr) {
        Local
        result := ""
        num    := ""
        For key, value in case_arr
            Loop, Parse, % value, % " "
                If (A_Index = 1)
                    num := A_LoopField
                Else result .= Round(num/A_LoopField) " "
        Return RTrim(result, " ")
    }
    
    ; Error handling
    error(msg, title:="There was an error", option:=0x0) {
        MsgBox, % option, % title, % msg
        Exit
    }
    
    Quit() {
        ExitApp
    }
    
    ; Check if integer
    is_int(num) {
        Return (Mod(num, 1) = 0)
    }
    
    ; Check if number
    is_num(num) {
        Return (num + 0 != "")
    }
}
