let input = """
16416 2069 mod 2414 362 mod 66 6 div div 2421 699 210 add mod add sqrt 20 7 sub 235 181 add add 13 div 50 3 mul 100 sqrt div 16 9 sub 38 19 div sub div div sub 287 10 5 sub mul 280 281 add mod 299 75 sub 210 add 4560 19 div sub sub 17 div div mul 39 11 7 sub 5 3 sub sub mul 12671 5 mul 6135 2 mul add sqrt add 45 122 add 2 mul 200 add 811 77 61 add 48 34 add add mod mod add 119 221 36 sqrt 208 16 div mul 6 div div div div 22 6 13 19 add 5 2 sub mul 272 16 div 81 sqrt sub div 3 div sub div mul mod 1261 557 add 1018 add 2 mul 355 24 12 div mul 900 sqrt 159 3 mul add add mod 92 51 sub 234 18 div mul sub 117 sub 42 64 9 add 35 sub 51984 sqrt 95 19 div 3 sub mul 19 25 sqrt mul 5 div div sub div mul 585071 220085 mod 153073 32696 mod mod 1470 mod 754 56 14 div 36 18 div sub mul add 135 3 mul 25 sqrt mul sqrt 5 div div 7056 sqrt 12 div 144 sqrt 105 15 div sub mul 68 21 sub 784 sqrt sub sub 1152 18 2 mul 4 sqrt div div sqrt div mul 788 951 532 add 20 11 mul mod 61 add 193 add 12 14 33 19 sub 4 sqrt div sub mul add sub sub sub sub
"""

enum Token {
    case number(value: Double)
    case op(name: String)
    case sqrt
    
    init(_ value: String) {
        if let num = Double(value) {
            self = .number(value: num)
        } else {
            switch value {
            case "sqrt":
                self = .sqrt
            default:
                self = .op(name: value)
            }
        }
    }
    
    init(_ value: Double) {
        self = .number(value: value)
    }
}

var stack = [Token]()
for item in input.split(separator: " ") {
    let token = Token(String(item))
    switch token {
    case .sqrt:
        guard case .number(let v) = stack.popLast()! else {
            fatalError()
        }
        stack.append(Token(sqrt(v)))
    case .number(let v):
        stack.append(Token(v))
    case .op(let name):
        guard case .number(let v2) = stack.popLast()!, case .number(let v1) = stack.popLast()! else {
            fatalError()
        }
        switch name {
        case "add":
            stack.append(Token(v1 + v2))
        case "sub":
            stack.append(Token(v1 - v2))
        case "mul":
            stack.append(Token(v1 * v2))
        case "div":
            stack.append(Token(v1 / v2))
        case "mod": fallthrough
        default:
            stack.append(Token(v1.truncatingRemainder(dividingBy: v2)))
        }
    }
}
assert(stack.count == 1)
guard case .number(let v) = stack.popLast()! else {
    fatalError()
}
print(Int(v.rounded()))
