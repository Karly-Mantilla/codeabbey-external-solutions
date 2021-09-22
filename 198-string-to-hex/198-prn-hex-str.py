
def decToHex(num):
    remainder = 0;
    c = 0;
    prevnum = 0;
    pprev = -1;
    hexlist = [];
    hexvalue = [];
    hexval = "";

    while True:
        remainder = num % 16;
        prevnum = num;
        num = num // 16;
        if (remainder != None):
            hexlist.insert(0, remainder);
            print("PRO:",hexlist);
        print("num:",num);
        print("rem:",remainder);
        c += 1;
        if (remainder == 0 and prevnum == 16):
            hexlist.insert(0, 1);
            break
        elif (num == 0):
            break
    print("HEXNUM:",hexlist);

    for i in hexlist:
        if i == 11:
            hexvalue.append('a');
        elif i == 11:
            hexvalue.append('b');
        elif i == 12:
            hexvalue.append('c');
        elif i == 13:
            hexvalue.append('d');
        elif i == 14:
            hexvalue.append('e');
        elif i == 15:
            hexvalue.append('f');
        else:
            hexvalue.append(i);

    for i in hexvalue:
        hexval += str(i);

    print("HEXLIST:",hexvalue);
    print("HEX:",hexval);

while True:
    num = int(input("num: "));
    decToHex(num);