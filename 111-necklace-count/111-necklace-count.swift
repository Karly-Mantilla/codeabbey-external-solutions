let input = """
8
6 2
3 16
9 6
9 1
9 4
11 6
7 2
5 4
"""

let totient = [0, 1, 1, 2, 2, 4, 2, 6, 4, 6, 4, 10, 4, 12, 6, 8, 8, 17]

func necklaces(ofAlphabet b: Int, withLength n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    for i in 1...n {
        if n % i == 0 {
            count += totient[i] * Int(pow(Double(b), Double(n) / Double(i)))
        }
    }
    return count / n
}

var answer = ""
let lines = input.split(separator: "\n")
for line in lines[1...] {
    let ints = line.split(separator: " ").map({ Int($0)! })
    let (b, n) = (ints[0], ints[1])
    answer += "\(necklaces(ofAlphabet: b, withLength: n)) "
}
print(answer.trimmingCharacters(in: .whitespaces))