array =  [[29, 0, 19],
         [6, 12, 94],
         [26, 17, 58],
         [25, 11, 81],
         [22, 5, 28],
         [10, 6, 13],
         [1, 14, 26],
         [10, 6, 18],
         [18, 5, 94]]

for i in array:
    num = (i[2]/2)*((2*i[0]) + (i[2] - 1) * i[1])
    print(int(num))