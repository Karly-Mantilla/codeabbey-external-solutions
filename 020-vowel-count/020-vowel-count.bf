words = input()
words = int(words)
list = []

for i in range(words):

    word = input()
    v = 0
    for i in word:
        if i == "a":
            v = v + 1
        if i == "e":
            v = v + 1
        if i == "y":
            v = v + 1
        if i == "i":
            v = v + 1
        if i == "o":
            v = v + 1
        if i == "u":
            v = v + 1
    list = list + [v]
    
  
for i in list:
    print(i, end=' ')

