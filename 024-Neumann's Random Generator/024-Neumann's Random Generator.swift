let input = """
11
3761 5845 3416 8397 6239 1345 4591 6716 2651 4655 9348
"""

func next(seed: Int) -> Int {
    assert(seed < 100000000)
    var nextSeed = seed * seed
    nextSeed /= 100
    nextSeed %= 10000
    return nextSeed
}

let ints = input.split(separator: "\n")[1].split(separator: " ").map({ Int($0)! })
var answer = ""
for seed in ints {
    var seeds = Set<Int>()
    seeds.insert(seed)
    
    var nextSeed = seed
    var iters = 0
    while true {
        nextSeed = next(seed: nextSeed)
        iters += 1
        if seeds.contains(nextSeed) {
            break
        }
        seeds.insert(nextSeed)
    }
    answer += "\(iters) "
}
print(answer.trimmingCharacters(in: .whitespaces))

