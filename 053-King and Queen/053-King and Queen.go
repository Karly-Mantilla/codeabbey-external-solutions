package main

import (
    "fmt"
    "strings"
)

func main() {

    input := `28
c4 d3
c4 a4
g6 a7
a2 d5
h8 g5
h1 a3
e2 g7
e1 e8
d1 c7
d3 b2
h2 a1
d5 f4
d4 a4
e2 f2
c4 h8
e4 h1
d2 h8
e1 b5
c2 e7
g3 b3
f2 f3
c3 d6
g4 f3
h6 d4
g3 c4
c4 h6
f4 d4
g5 f4`
    rows := strings.Split(input,"\n")
    //fmt.Println(input)
    
    rows = rows[1:len(rows)]
    
    answers := KingAndQueen(rows)
    for _, i := range answers{
        if (i == true){
            fmt.Print("Y ")
        } else {
            fmt.Print("N ")
        }
    }
    
}

func KingAndQueen(a []string)(answers []bool){
    for _, i := range a{
        fmt.Println(i)
        if (checkHorz(strings.Split(i, " "))){
            answers = append(answers, true)
        }else if (checkVert(strings.Split(i, " "))){
            answers = append(answers, true)
        }else if (checkDiag(strings.Split(i, " "))){
            answers = append(answers, true)
        }else {
            answers = append(answers, false)
        }

    }
    return answers 
}


func checkHorz(a []string) (b bool){
    if (a[0][0] == a[1][0]){
        b = true
    } else {
        b = false
    }

    return b
}

func checkVert(a []string) (b bool){
    if (a[0][1] == a[1][1]){
        b = true
    } else {
        b = false
    }

    return b
}
func checkDiag(a []string) (b bool){

    x1, y1, x2, y2 := int(a[0][0]) - 96 ,int(a[0][1]) - 48, int(a[1][0]) - 96, int(a[1][1]) - 48
    fmt.Println("cood1:", x1, y1, "cood2:", x2, y2)
    
    if (x1 - x2 == y1 - y2){
        b = true
        return
    }
    q := int(x1 - x2)
    w := int(y1 - y2)
    fmt.Println(q, w)
    if (q == -w){
        b = true
        return
    }
    b = false
    return
}