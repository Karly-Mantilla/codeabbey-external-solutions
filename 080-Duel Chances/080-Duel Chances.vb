#lang "fblite"
common shared MYARRAY()
function stringtoarray(st$,delim$=" ") 
    dim MYARRAY(len(st$)) 
    wd$="":count=1
    for i=1 to len(st$)
        if mid(st$,i,1)<>delim$ then:wd$+=mid$(st$,i,1):else:MYARRAY(count)=val(wd$):wd$="":count+=1:end if
    next
    MYARRAY(count)=val(wd$) 'Or last value will be missed
    stringtoarray=count
end function


defdbl A,B,r
input n
sol$=""
for in=1 to n
    input opg$
    stringtoarray(opg$)
    A=MYARRAY(1):B=MYARRAY(2)
    rest=100:Alife=0
    while rest>0.00000001
        Alife+=rest*A/100
        rest=rest-rest*A/100
        rest=rest-rest*B/100
    wend
    sol$+=str(int(Alife+0.5))+" "
next
print sol$
Length: 701