with Ada.Integer_Text_IO;
procedure Triangles is
    package IO renames Ada.Integer_Text_IO;
    n, a, b, c : Integer;
begin
    IO.Get(n);
    while n > 0 loop
        IO.Get(a); IO.Get(b); IO.Get(c);
        if a + b >= c and a + c >= b and b + c >= a then
            IO.Put(1);
        else
            IO.Put(0);
        end if;
        n := n - 1;
    end loop;
end Triangles;