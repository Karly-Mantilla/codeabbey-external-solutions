package main

import (
        "fmt"
        "strings"
)

func winning(m, k int, strategy string) (solution int) {
        if strategy == "i" {
                solution = m%(k+1) - 1
        } else {
                solution = m % (k + 1)
        }
        if solution < 0 {
                solution = k
        }
        return
}

func main() {
        var n int
        fmt.Scan(&n)

        var ss []string
        for i := 1; i <= n; i++ {
                var (
                        m, k     int
                        strategy string
                )
                fmt.Scan(&m, &k, &strategy)

                ss = append(ss, fmt.Sprintf("%v", winning(m, k, strategy)))
        }
        fmt.Println(strings.Join(ss, " "))
}