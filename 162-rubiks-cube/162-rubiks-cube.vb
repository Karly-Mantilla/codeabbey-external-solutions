sub main
        
    for each move in input.split(" ").toArray
        select case move        
            case "B" : RotateFace(B) : RotateSides("U210", "L036", "D678", "R852") 
            case "D" : RotateFace(D) : RotateSides("F678", "R678", "B678", "L678")
            case "F" : RotateFace(F) : RotateSides("U678", "R036", "D210", "L852")                
            case "L" : RotateFace(L) : RotateSides("U036", "F036", "D036", "B852") 
            case "R" : RotateFace(R) : RotateSides("U852", "B036", "D852", "F852")
            case "U" : RotateFace(U) : RotateSides("B210", "R210", "F210", "L210")
            case else : debug.assert(false) ' wut?            
        end select            
    next
    
    dim result(8) as string, s = "BULFRD", n = 0
    for each face in {B, U, L, F, R, D}
        for i = 0 to 8
            if face(i) > 0 then result(face(i) - 1) = s(n)
        next
        n += 1
    next
    string.join(" ", result).dump
    
end sub

private F() as integer = {7,8,9,4,5,6,1,2,3}
private B(8), U(8), L(8), R(8), D(8) as integer

sub RotateFace(face() as integer)
    dim tmp(8) as integer, i = 0
    array.copy(face, tmp, 9)    
    for each n in {6,3,0,7,4,1,8,5,2}
        face(i) = tmp(n)
        i += 1
    next
end sub

sub RotateSideS(ParamArray groups() as string)
    
    dim tmp(3,2) as integer, ptr() as integer = nothing, n = 0
    
    ' get the cubes from their current position
    for each grp in groups
        
        ' get source face
        select case grp(0)
            case "B" : ptr = B
            case "U" : ptr = U
            case "L" : ptr = L
            case "F" : ptr = F
            case "R" : ptr = R
            case "D" : ptr = D
        end select
        
        ' get source cubes
        tmp(n, 0) = ptr(val(grp(1)))
        tmp(n, 1) = ptr(val(grp(2)))
        tmp(n, 2) = ptr(val(grp(3)))
                
        n += 1
    next
    
    ' put the cubes in their new rotated positions
    n = 3
    for each grp in groups
        
        ' get dest face
        select case grp(0)
            case "B" : ptr = B
            case "U" : ptr = U
            case "L" : ptr = L
            case "F" : ptr = F
            case "R" : ptr = R
            case "D" : ptr = D
        end select
        
        ' get dest cubes from tmp
        ptr(val(grp(1))) = tmp(n, 0)
        ptr(val(grp(2))) = tmp(n, 1)
        ptr(val(grp(3))) = tmp(n, 2)
                
        n += 1
        if n > 3 then n = 0
    next
end sub