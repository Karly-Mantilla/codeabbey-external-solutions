let input = """
92
R F B F D F F F L F D R U F D R R U B R L F L U D B B R R D B U R B R F F L U F B B L D U D F B L F L L U R F B R U R D L L L R L R B F D D D R D U F L B D B B R L L F R F F U D B L D
"""

 enum Face : String, CaseIterable {
    case front = "F"
    case right = "R"
    case back = "B"
    case left = "L"
    case top = "U"
    case bottom = "D"
}

enum Color : String, CaseIterable {
    case Y
    case B
    case G
    case O
    case R
    case W
}

struct Square {
    let idx: Int
    var color: Color
    var tag: String
    var face: Face { return Face.allCases[idx / 9] }
    
    func lite() -> SquareLite {
        return SquareLite(color: color, tag: tag)
    }
    
    mutating func assume(_ lite: SquareLite) {
        color = lite.color
        tag = lite.tag
    }
}

struct SquareLite {
    let color: Color
    let tag: String
}

func Q(_ color: Color, _ tag: String) -> SquareLite {
    return SquareLite(color: color, tag: tag)
}

struct Cube {
    var squares: [Square]
    private var affected = Set<Int>()
    
    init() {
        squares = [Square]()
        var counter = 0
        for color in Color.allCases {
            for _ in 0..<9 {
                squares.append(Square(idx: counter, color: color, tag: String(counter + 1)))
                counter += 1
            }
        }
    }
    
    mutating func rotate(face: Face) {
        let changes: [Int:SquareLite]
        switch face {
        case .front:
            changes = [
                // front
                0: at(2), 1: at(5), 2: at(8),
                3: at(1), 4: at(4), 5: at(7),
                6: at(0), 7: at(3), 8: at(6),
                // right
                9: at(44), 12: at(41), 15: at(38),
                // left
                29: at(53), 32: at(52), 35: at(51),
                // top
                38: at(29), 41: at(32), 44: at(35),
                // bottom
                51: at(9), 52: at(12), 53: at(15)
            ]
        case .right:
            changes = [
                // right
                9: at(11), 10: at(14), 11: at(17),
                12: at(10), 13: at(13), 14: at(16),
                15: at(9), 16: at(12), 17: at(15),
                // front
                2: at(47), 5: at(50), 8: at(53),
                // back
                18: at(42), 21: at(43), 24: at(44),
                // top
                42: at(8), 43: at(5), 44: at(2),
                // bottom
                47: at(24), 50: at(21), 53: at(18)
            ]
        case .back:
            changes = [
                // back
                18: at(20), 19: at(23), 20: at(26),
                21: at(19), 22: at(22), 23: at(25),
                24: at(18), 25: at(21), 26: at(24),
                // top
                36: at(17), 39: at(14), 42: at(11),
                // left
                27: at(36), 30: at(39), 33: at(42),
                // bottom
                45: at(33), 46: at(30), 47: at(27),
                // right
                11: at(45), 14: at(46), 17: at(47)
            ]
        case .left:
            changes = [
                // left
                27: at(29), 28: at(32), 29: at(35),
                30: at(28), 31: at(31), 32: at(34),
                33: at(27), 34: at(30), 35: at(33),
                // top
                36: at(20), 37: at(23), 38: at(26),
                // front
                0: at(38), 3: at(37), 6: at(36),
                // bottom
                45: at(0), 48: at(3), 51: at(6),
                // back
                20: at(51), 23: at(48), 26: at(45)
            ]
        case .top:
            changes = [
                // top
                36: at(38), 37: at(41), 38: at(44),
                39: at(37), 40: at(40), 41: at(43),
                42: at(36), 43: at(39), 44: at(42),
                // left
                33: at(6), 34: at(7), 35: at(8),
                // front
                6: at(15), 7: at(16), 8: at(17),
                // right
                15: at(24), 16: at(25), 17: at(26),
                // back
                24: at(33), 25: at(34), 26: at(35)
            ]
        case .bottom:
            changes = [
                // bottom
                45: at(47), 46: at(50), 47: at(53),
                48: at(46), 49: at(49), 50: at(52),
                51: at(45), 52: at(48), 53: at(51),
                // front
                0: at(27), 1: at(28), 2: at(29),
                // right
                9: at(0), 10: at(1), 11: at(2),
                // back
                18: at(9), 19: at(10), 20: at(11),
                // left
                27: at(18), 28: at(19), 29: at(20)
            ]
        }
        assert(changes.count == 21)
        assert(affected.count == 21)
        assert(affected.symmetricDifference(changes.keys).isEmpty)
        for change in changes {
            squares[change.key].assume(change.value)
        }
        affected.removeAll()

        if true {
            var colors = [Color:Int]()
            var tags = Set<String>()
            for square in squares {
                colors[square.color, default: 0] += 1
                tags.insert(square.tag)
            }
            assert(tags.count == 54)
            for entry in colors {
                assert(entry.value == 9)
            }
        }
    }
    
    private mutating func at(_ i: Int) -> SquareLite {
        affected.insert(i)
        return squares[i].lite()
    }
}

let moves = input.split(separator: "\n")[1].split(separator: " ").map({ Face(rawValue: String($0))! })
var cube = Cube()
for move in moves {
    cube.rotate(face: move)
}

var tags = ([Int](0..<9).map({ String($0 + 1) }))
var answers = [String:Face]()
for square in cube.squares {
    if tags.contains(square.tag) {
        answers[square.tag] = square.face
    }
}
var answer = ""
for tag in tags {
    answer += (answers[tag]?.rawValue ?? "*") + " "
}
print(answer)