let input = """
25
2 3 4 5 1
6 1 5 2 2
3 5 3 4 2
2 3 4 5 1
3 3 3 3 3
2 3 4 5 1
2 3 4 5 1
2 6 5 2 3
2 3 4 5 1
2 3 4 5 1
1 6 1 3 3
2 3 6 3 4
2 3 4 5 6
3 5 4 5 5
2 3 4 5 1
2 3 4 5 1
4 1 5 5 6
5 1 5 1 5
6 5 2 1 1
4 4 2 2 5
2 3 4 5 1
6 1 6 5 6
5 4 1 1 4
4 3 2 5 6
2 3 4 5 6
"""

var answer = ""
let lines = input.split(separator: "\n")
for line in lines[1...] {
    let sorted = line.split(separator: " ").map({ Int($0)! }).sorted()
    var grouped = [Int:Int]()
    for i in sorted {
        grouped[i] = grouped[i] ?? 0 + 1
    }
    let groups = grouped.values.sorted()
    
    func isSequential(from i: Int, through k: Int) -> Bool {
        var last = sorted[i]
        for p in i + 1...k {
            if sorted[p] != last + 1 {
                return false
            }
            last = sorted[p]
        }
        return true
    }
    
    func isSame(from i: Int, through k: Int) -> Bool {
        return sorted[i...k].reduce(0, +) == (k - i + 1) * sorted[i]
    }
    
    switch groups.count {
    case 1:
        answer += "yacht "
    case 2:
        if groups[0] == 4 || groups[1] == 4 {
            answer += "four "
        } else {
            answer += "full-house "
        }
    case 3:
        if isSame(from: 0, through: 2) || isSame(from: 1, through: 3) || isSame(from: 2, through: 4) {
            answer += "three "
        } else {
            answer += "two-pairs "
        }
    case 4:
        answer += "pair "
    case 5: fallthrough
    default:
        if isSequential(from: 0, through: 4) {
            answer += sorted[0] == 1 ? "small-straight " : "big-straight "
        } else {
            answer += "none "
        }
    }
}
print(answer.trimmingCharacters(in: .whitespaces))