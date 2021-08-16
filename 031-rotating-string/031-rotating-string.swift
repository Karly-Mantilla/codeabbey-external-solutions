let input = """
13
4 qudlgnzicchowiuldfuyiqisu
2 oztmowxueregtevkdjvgok
-6 ekypdolebxlypyuaudubyifc
6 irizvssewaqtciioxiyy
-3 eumcwanhyipzuclzylj
-5 kijibcdupbrudhurpuqi
1 aezmgfzypcbyedu
-3 roazlsihchugiedbjkgdcwgeo
-4 lahujiwuaiuufzdoxh
4 weunkyouagaaoedxtyrsv
2 rgfzvglmkazvzvkzoktj
-3 aqsmfbeutkamaby
7 garuklxuybowcwhvdmxhbks
"""

let lines = input.split(separator: "\n")
var answer = ""
for line in lines[1...] {
    let strs = line.split(separator: " ")
    var k: Int
    let str: [Character]
    (k, str) = (Int(strs[0])!, [Character](strs[1]))
    if k < 0 {
        k = str.count + k
    }
    let rotated = "" + str[k..<str.count] + str[0..<k]
    answer += rotated + " "
}
print(answer.trimmingCharacters(in: .whitespaces))