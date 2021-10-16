data = "111010000100100001111010100001100111101001011011001100011100011011100010001100011000011100100010011000111100010010011001011100001100110"

result = ""
ones = 0
counter = 0
totalCounter = 0
totalParents = 0


for i in range(0, len(data)):
    ones = 0
    for i in range(0, len(data)):
        if data[i] == "1":
            ones += 1


while data != "10":
    data += "x"
    for i in range(0, len(data)-1):
        if data[i] == data[i+1]:
            counter = counter+1
        else:
            counter += 1
            result += str(bin(counter)[2:])
            counter = 0
    data = result
    totalCounter += 1
    result = ""
print(totalCounter, 2**(ones-1))
