a = int(input())
for i in range(a):
    ch = input().split()
    ot = 0
    A = 0
    for elem in ch:
        if elem == 'A':
            A+=1
            continue
        try:
            ot+=int(elem)
        except:
            ot+=10
    while A > 0:
        if ot+11>21:
            ot+=1
            A-=1
        else:
            ot+=11
            A-=1
    if ot > 21:
        ot = "Bust"
    print(ot)
    