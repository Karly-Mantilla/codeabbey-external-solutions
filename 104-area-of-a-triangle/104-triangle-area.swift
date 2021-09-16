let input = """
16
3187 9843 2784 9222 5989 2318
9563 2462 6590 9767 7436 5944
2867 2443 2336 6991 4538 1062
8580 191 6937 2645 7345 6744
9215 5470 2150 5146 7136 3198
1449 323 3040 4233 9544 9028
6550 9107 1490 3140 8873 8925
9083 1740 1367 1419 8731 5904
2480 7310 6095 9416 9955 3440
6160 9169 8909 8310 4315 6045
1507 5764 6367 4546 9996 5911
3574 6546 5017 5063 9686 3889
3987 8768 5629 5354 187 4359
1257 2666 1669 7352 2082 1623
791 8242 792 9700 6551 5107
5744 8057 870 2111 2603 866
"""

var answer = ""

struct Vector {
    let x: Double
    let y: Double
    
    func cross(_ v: Vector) -> Double {
        return x * v.y - v.x * y
    }
    
    static func -(lhs: Vector, rhs: Vector) -> Vector {
        return Vector(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}

let lines = input.split(separator: "\n")
for line in lines[1...] {
    let doubles = line.split(separator: " ").map({ Double($0)! })
    let (a, b, c) = (Vector(x: doubles[0], y: doubles[1]), Vector(x: doubles[2], y: doubles[3]), Vector(x: doubles[4], y: doubles[5]))
    let (u, v) = (b - a, c - a)
    let area = abs(u.cross(v)) / 2
    answer += "\(area) "
    
}
print(answer.trimmingCharacters(in: .whitespaces))