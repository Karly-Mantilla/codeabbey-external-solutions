fname = 'data111.txt' # enter filename

def ReadFileSt(fname):  # read strings
    f = open (fname, 'r')
    data = f.read()
    f.close()
    L = data.splitlines()
    return L
# end fun

NL = ReadFileSt(fname)

sz = int(NL[0])

st = ''
for i in range(sz):
    L = NL[i+1].split()
    B = int(L[0])
    N = int(L[1])
    MX = B**N
    F = [0 for x in xrange(MX)]
    M = MX/B
    tot = 0
    for n in xrange(MX):
        sv = n
        for k in range(N-1):
            d = n%B
            n = M*d + n/B
            if n < sv:
                sv = n
            # endif
        # endfor k
        if F[sv] == 0:
            tot += 1
            F[sv] = 1
        # endif
    # endfor n
    st += str(tot) + ' '
# endfor i
print st