N=int(input(""))
a=list()
c=0
for i in range(N):
    word=input("")
    for i in word:
        if(i=='a' or i=='e' or i=='i' or i=='o' or i=='u' or i=='y'):
            c+=1
    a.append(c)
    c=0
print(*a)
