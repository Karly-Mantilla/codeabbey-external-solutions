let input = """
11
77 69
112 7
78 8
120 7
85 78
51 10
115 7
97 90
64 56
93 86
80 72
"""

var answer = ""

let lines = input.split(separator: "\n")
for line in lines[1...] {
    let ints = line.split(separator: " ").map({ Int($0)! })
    let (n, k) = (ints[0], ints[1])
    
    if k == 0 {
        answer += "1 "
        continue
    }
    var ns = Set<Int>(2...n)
    for i in 2...k {
        ns.remove(i)
    }
    var ks = Set<Int>()
    for i in 2...n-k {
        if ns.remove(i) == nil {
            ks.insert(i)
        }
    }
    let combos = ns.reduce(1, *) / ks.reduce(1, *)
    answer += "\(combos) "
}
print(answer)