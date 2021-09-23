def getData(fname, dtype=str):
    with open(fname,"r") as f:
        return [line.strip().split() for line in f.readlines()][1:]

def solve(k,q):
    hor = "abcdefgh"
    ver = "12345678"
    if q[0] in k or q[1] in k:
        return "Y"
    elif abs(hor.index(k[0])-hor.index(q[0])) == abs(ver.index(k[1])-ver.index(q[1])):
        return "Y"
    else:
        return "N"

print " ".join(solve(*move) for move in getData("053.txt"))