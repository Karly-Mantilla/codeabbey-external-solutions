Sub Main

    Dim input = <![CDATA[
2 2 2 2
2 2 2 2
2 2 2 4
4 4 2 2
R R L U D U D R D U U
]]>.Value() 
    
    ' Load grid to array    
    dim grid(3, 3) as integer

    Dim lines = input.Trim.Split(Microsoft.VisualBasic.vbLf)
    dim y = 0, x = 0
    dim moves = new list(of string)
    for each line in lines
        if line is lines.last then
            moves = line.split(" "c).tolist            
        else
            dim nums = line.split(" "c).tolist.select(function(q) cint(q)).tolist
            for each n in nums
                grid(y, x) = n
                x += 1
            next 
            y +=1 : x = 0
        end if
    next
    
    for each move in moves
        select case move
            case "U": VertAdd(grid, 0, 2, 1)
            case "D": VertAdd(grid, 3, 1, -1)
            case "L": HorzAdd(grid, 0, 2, 1)
            case "R": HorzAdd(grid, 3, 1, -1)
        end select
    next
    
    dim ans = Counts(grid)
    ans.dump
    
End Sub

sub VertAdd(grid(,) as integer, deb as integer, fin as integer, stp as integer)
    VertMove(grid, deb, fin, stp)
    for y = deb to fin step stp
        for x = 0 to 3
            if grid(y,x) = grid(y+stp,x) then
                grid(y,x) *= 2 : grid(y+stp,x) = 0
            end if
        next
    next
    VertMove(grid, deb, fin, stp)
end sub

sub VertMove(grid(,) as integer, deb as integer, fin as integer, stp as integer)
    dim moved as boolean
    do
        moved = false
        for y = deb to fin step stp
            for x = 0 to 3
                if grid(y,x) = 0 then
                    grid(y,x) = grid(y+stp,x)
                    grid(y+stp,x) = 0
                    if grid(y,x) <> 0 then moved = true
                end if
            next
        next
    loop until moved = false
end sub

sub HorzAdd(grid(,) as integer, deb as integer, fin as integer, stp as integer)
    HorzMove(grid, deb, fin, stp)
    for x = deb to fin step stp
        for y = 0 to 3
            if grid(y,x) = grid(y,x+stp) then
                grid(y,x) *= 2 : grid(y,x+stp) = 0
            end if
        next
    next
    HorzMove(grid, deb, fin, stp)
end sub

sub HorzMove(grid(,) as integer, deb as integer, fin as integer, stp as integer)
    dim moved as boolean
    do
        moved = false
        for x = deb to fin step stp
            for y = 0 to 3
                if grid(y,x) = 0 then
                    grid(y,x) = grid(y,x+stp)
                    grid(y,x+stp) = 0
                    if grid(y,x) <> 0 then moved = true
                end if
            next
        next
    loop until moved = false
end sub

function Counts(grid) as string
    dim s = ""
    dim max = 2
    dim n = 2 
    do while n <= max
        dim sum = 0
        for y = 0 to 3
            for x = 0 to 3
                if grid(y,x) = n then sum += 1
                if grid(y,x) > max then max = grid(y,x)
            next
        next
        s &= sum & " "
        n = n * 2
    loop 
    return s
end function
