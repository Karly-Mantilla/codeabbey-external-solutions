temps = input("input:\n").split()
res = []
for i in range(1,int(temps[0])+1):
    res.append(round((5/9)*(int(temps[i])-32)))
print("answer:\n")
print(*res)