local op=assert(io.open("op.txt", "w"));

function bubSort (table)
    for i=1, #table-1 do
        for j=i+1, #table do
            if table[i]>table [j] then table[i], table [j]=table [j], table[i];end
        end
    end
end

local n=io.read("*n", 1);
local inp={};
for i=1, n do
    inp[1], inp[2], inp[3]=io.read("*n", "*n", "*n");
    bubSort(inp);
    if inp[1]+inp[2]>=inp[3] then op:write(1, " ");
    else op:write(0, " "); end
end