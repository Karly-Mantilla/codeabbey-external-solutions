Sub Main ' LINQPad 4
    for each line in input.Split(vbLf)
        dim nums = line.split(" "c).tolist.select(function(x) cint(x))
        
        ' http://en.wikipedia.org/wiki/Necklace_(combinatorics)
        dim k = nums(0)
        dim n = nums(1)            
        dim divs = getdivisors(n)                
        dim sum = 0
        for each d in divs
            sum += totient(d) * k^(n/d)
        next
        sum = 1/n * sum
        debug.write(sum & " ")    
    next
End Sub

function Totient(n as integer) as integer
    dim sum = 0
    for i = 0 to n-1
        if gcd(i, n) = 1 then sum+=1
    next
    return sum
end function

function GCD(a as integer, b as integer) as integer ' Euclid's Algorithm
    dim temp = 0
    do while b <> 0
        temp = a mod b
        a = b
        b = temp
    loop
    return a
end function

function GetDivisors(n as integer) as ienumerable(of integer)
    return from a in enumerable.range(1, n)
           where n mod a = 0
           select a
end function

function input as string
    return <![CDATA[
4 4
4 10
5 9
3 13
8 1
3 16
4 11
]]>.Value.Trim
end function
