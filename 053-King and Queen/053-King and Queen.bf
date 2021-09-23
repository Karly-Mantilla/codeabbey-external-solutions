n, s, rules = int(input()), "", ["a", "b", "c", "d", "e", "f", "g", "h"]
for _ in range(n):
    k, q = [[x[0], int(x[1])] for x in input().split()]
    k[0], q[0], pas = rules.index(k[0]) + 1, rules.index(q[0]) + 1, False
    if k[0] == q[0] or k[1] == q[1]:
        s += "Y "
        pas = True
    if not pas:
        for _ in range(1):
            i = q.copy()
            while 9 > i[0] > -1 and 9 > i[1] > -1:
                if i == k:
                    pas = True
                    s += "Y "
                    break
                i[0] += 1
                i[1] += 1
            if pas:
                break
            i = q.copy()
            while 9 > i[0] > -1 and 9 > i[1] > -1:
                if i == k:
                    pas = True
                    s += "Y "
                    break
                i[0] -= 1
                i[1] += 1
            if pas:
                break
            i = q.copy()
            while 9 > i[0] > -1 and 9 > i[1] > -1:
                if i == k:
                    pas = True
                    s += "Y "
                    break
                i[0] += 1
                i[1] -= 1
            if pas:
                break
            i = q.copy()
            while 9 > i[0] > -1 and 9 > i[1] > -1:
                if i == k:
                    pas = True
                    s += "Y "
                    break
                i[0] -= 1
                i[1] -= 1
            if pas:
                break
        if not pas:
            s += "N "
print(s)