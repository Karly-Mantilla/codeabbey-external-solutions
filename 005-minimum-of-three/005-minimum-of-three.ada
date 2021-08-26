with Ada.Integer_Text_IO;
procedure Min_of_3 is
    package IO renames Ada.Integer_Text_IO;
    n, smaller, greater : Integer;
begin
    IO.Get(n);
    while n > 0 loop
        IO.Get(smaller);
        IO.Get(greater);
        if smaller > greater then
            smaller := greater;
        end if;
        IO.Get(greater);
        if smaller > greater then
            smaller := greater;
        end if;
        IO.Put(smaller);
        n := n - 1;
    end loop;
end Min_of_3;