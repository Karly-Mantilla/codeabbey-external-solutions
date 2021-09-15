var answer = ""
let lines = input.split(separator: "\n")
for line in lines[1...] {
    let game = line.split(separator: " ")
    let (M, K, normal) = (Int(game[0])!, Int(game[1])!, game[2] == "n")
    let m = normal ? M : (M - 1)
    if m.isMultiple(of: K + 1) {
        answer += "0 "
    } else {
        answer += "\(m % (K + 1)) "
    }
}
print(answer)