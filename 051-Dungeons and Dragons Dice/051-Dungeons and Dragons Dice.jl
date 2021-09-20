f = open("codeabbey/input.txt")
lines = readlines(f)
results = []

Δ(n) = (1/2)*n*(n+1)
expectation(d, s) = (1/s)*Δ(s)*d
mean(a) = sum(a)/length(a)

function analyze_castings(ca)
    e = vec(reshape([((a,b), expectation(b,a)) for a = 2:2:12, b=1:5], 30, 1))
    sort!(e, by = x -> x[2], alg=QuickSort)
    m = mean(ca)

    left, right = 1, length(e)

    while right-left >= 1
        middle = (left+right)/2
        lm, rm = Int64(floor(middle)), Int64(ceil(middle))

        if e[lm][2] < m
            left = rm
        elseif e[rm][2] > m
            right = lm
        else
            return e[lm][1]
        end
    end

    return e[Int64(round((left+right)/2))][1]
end

for l = lines
    inputs = [parse(Int64, x)  for x = split(l, " ")][1:end-1]
    res = analyze_castings(inputs)
    push!(results, "$(res[2])d$(res[1])")
end

for r = results
    print(r, " ")
end
