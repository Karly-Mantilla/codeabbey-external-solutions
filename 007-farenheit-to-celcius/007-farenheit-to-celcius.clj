x = int(input())
z = [int(i) for i in input().split()]
for j in z:
    j = (j - 32) / 1.8
    b = []
    b.append(j)
    print(round(*(b)), end= ' ')
