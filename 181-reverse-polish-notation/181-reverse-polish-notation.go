package main

import (
        "bufio"
        "fmt"
        "math"
        "os"
        "strconv"
        "strings"
)

func rpn(s string) float64 {
        var stack []float64

        push := func(n float64) { stack = append(stack, n) }
        pop := func() (top float64) {
                if len(stack) == 0 {
                        return
                }

                top = stack[len(stack)-1]
                stack = stack[:len(stack)-1]
                return
        }

        for _, cmd := range strings.Split(s, " ") {
                switch cmd {
                case "add":
                        b, a := pop(), pop()
                        push(a + b)
                case "sub":
                        b, a := pop(), pop()
                        push(a - b)
                case "div":
                        b, a := pop(), pop()
                        push(a / b)
                case "mul":
                        b, a := pop(), pop()
                        push(a * b)
                case "mod":
                        b, a := pop(), pop()
                        push(math.Mod(a, b))
                case "sqrt":
                        push(math.Sqrt(pop()))
                default:
                        n, _ := strconv.ParseFloat(cmd, 64)
                        push(n)
                }
        }
        return pop()
}

func main() {
        in, _ := bufio.NewReader(os.Stdin).ReadString('\n')

        fmt.Println(rpn(strings.TrimSpace(in)))
}