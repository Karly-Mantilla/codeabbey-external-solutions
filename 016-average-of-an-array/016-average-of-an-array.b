var = []
avg = []
le = 0
y = 0
#----------------------------------------------------------------------------
def rounding(avg):
    for i in range(n):
        y = avg[i]%1
        if avg[i] < 0:
            if y >= -0.5:
                avg[i] = avg[i] - y
            elif y < -0.5:
                y = 1 - y
                avg[i] = avg[i] + y
        elif avg[i] > 0:
            if y >= 0.5:
                y = 1 - y
                avg[i] = avg[i] + y
            elif y < 0.5:
                avg[i] = avg[i] - y
        else:
            avg[i] = 0
    return(avg)

n = int(input("n: "))
for x in range(n):
    var.append(0)
    avg.append(0)
    var[x] = [int(i) for i in input().split(' ')]
#----------------------------------------------------------------------------
for x in range(n):
    le = len(var[x])
    for y in range(le):
        if var[x][y] == 0:
            le = le - 1
    avg[x] = sum(var[x]) / le
avg = rounding(avg)
print(*avg)