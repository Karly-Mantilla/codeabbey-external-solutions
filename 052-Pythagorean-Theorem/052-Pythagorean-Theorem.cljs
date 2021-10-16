def getData(fname):
    with open(fname,"r") as f:
        data = [map(float,line.strip().split()) for line in f.readlines()][1:]
        return data

def evaluatePyth(a,b,c):
    result = (a**2 + b**2)**0.5
    if result  == c:
        return "R"
    elif result < c:
        return "O"
    else:
        return "A"


print " ".join(evaluatePyth(*i) for i in getData("052.txt"))