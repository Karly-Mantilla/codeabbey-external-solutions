with Ada.Integer_Text_IO;
procedure Duel is
    package IO renames Ada.Integer_Text_IO;
    n, t : Integer;
    a, b : Float;
begin
    IO.Get(n);
    while n > 0 loop
        IO.Get(t);
        a := Float(t);
        IO.Get(t);
        b := Float(t);
        IO.Put(Integer(a/(1.0-(1.0 - a/100.0)*(1.0 - b/100.0))));
        n := n - 1;
    end loop;
end Duel;