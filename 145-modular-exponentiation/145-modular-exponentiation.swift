let input = """
18
591323851 1061963015 352491299
315173130 1923390421 213582997
509291715 1579063317 343128481
956868942 1513376278 180286159
849468019 1941508998 269682059
489934134 1334497032 224568143
165099934 1985419034 289978439
636344525 1661679264 298743509
270157700 1115555077 327702223
160073728 1394412773 224622859
705461971 1814837108 387861127
415658243 1039530807 289382459
700102394 1023635145 168780167
400616719 1528433902 252444209
622021573 1537141858 252597979
427636823 1099169803 150203699
364994211 1313809845 210341983
458589314 1980128667 327779581
"""

var answer = ""

let lines = input.split(separator: "\n")
for line in lines[1...] {
    let ints = line.split(separator: " ").map({ Int($0)! })
    var (a, b, m) = (ints[0], ints[1], ints[2])
    
    var x = 1;
    var y = a;
    while (b > 0) {
        if ((b % 2) == 1) {
            x = (x * y) % m;
        }
        y = (y * y) % m;
        b /= 2;
    }
    answer += "\(x % m) "
}
print(answer)