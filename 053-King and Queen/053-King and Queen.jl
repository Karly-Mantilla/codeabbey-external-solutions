function king_and_queen(pos_k, pos_q)
    
    row_k = parse(Int,pos_k[2])
    col_k = Int(pos_k[1]) - 96
    
    row_q = parse(Int,pos_q[2])
    col_q = Int(pos_q[1]) - 96
    
    
    dif_col = abs(col_q - col_k)
    dif_row = abs(row_q - row_k)
    
    if row_q == row_k || col_q == col_k || dif_row == dif_col
        return "Y"
    else
        return "N"
    end
    
end 

input = """25
e2 f2
g3 c1
d2 g8
b5 a1
b7 h1
g8 b6
b8 c1
d2 e1
d3 c2
f6 b1
g1 a1
e1 a7
g1 h6
h1 d2
a7 b5
a7 f4
a8 e7
e7 g4
h8 d5
a5 c7
f3 e5
c8 f4
f8 h6
f5 b7
e7 e1"""


input = split(input, "\n")
N = parse(Int, input[1])

for i in 2:N+1
    
    pos_k, pos_q = split(input[i])
    
    println(king_and_queen(pos_k, pos_q))
    
end