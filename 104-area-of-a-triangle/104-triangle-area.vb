#lang "fblite"
defdbl x,y,a
common shared MYARRAY() 
function stringtoarray(st$,delim$=" ") 
    dim MYARRAY(len(st$)) 
    wd$="":count=1
    for i=1 to len(st$)
        if mid(st$,i,1)<>delim$ then:wd$+=mid$(st$,i,1):else:MYARRAY(count)=valint(wd$):wd$="":count+=1:end if
    next
    MYARRAY(count)=valint(wd$) 'Or last value will be missed
    stringtoarray=none 
end function

ans$=""
input n
for i=1 to n
    input opg$
    stringtoarray(opg$)
    x1=MYARRAY(1):y1=MYARRAY(2):x2=MYARRAY(3):y2=MYARRAY(4):x3=MYARRAY(5):y3=MYARRAY(6)
    a=(x1*(y3-y2)+x2*(y1-y3)+x3*(y2-y1))/2
    ans$+=str(abs(a))+" "
next
print ans$