With Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
Use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

Procedure Problem12 is
    Q   : Integer;
    V   : Integer;
    N   : Integer;
    Ans : Array (0 .. 1024) of Float;

    Function Sqrt(V: Integer; S: Integer) return Float is
        R: Float := 1.0;
    begin
        For i in integer range 1 .. S loop
            R := (R + Float(V) / R) / 2.0;
        end loop;
        return R;
    end Sqrt;
Begin
    Get(Q);
    For i in integer range 0 .. Q - 1 loop
        Get(V); Get(N);
        Ans(i) := Sqrt(V, N);
    end loop;
    For i in integer range 0 .. Q - 1 loop
        Put(Item=>Ans(i), Fore=>0, Aft=>7, Exp=>0); Put(' ');
    end loop;
    New_Line;
end Problem12;