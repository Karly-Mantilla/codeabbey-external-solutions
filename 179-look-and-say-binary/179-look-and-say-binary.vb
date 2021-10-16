sub main
    
    dim bits = input
    dim stp = 0
    do
        bits = LookAndSayBin(bits)
        stp += 1
    loop until bits = "10"    
    
    ' parents = 2^(number of ones - 1)
    dim parents = bigInteger.Pow(2, ( input.length - input.replace("1","").length - 1 ))
    console.writeLine(stp & " " & parents.toString)
    
end sub

function LookAndSayBin(bits as string) as string
    dim dgt = "1"c, cnt = 0, str = ""
    for each bit in bits
        if bit = dgt then
            cnt += 1
        else
            str &= Convert.ToString(cnt, 2)
            if dgt = "0"c then dgt = "1"c else dgt = "0"c
            cnt = 1
        end if            
    next
    str &= Convert.ToString(cnt, 2)        
    return str
end function