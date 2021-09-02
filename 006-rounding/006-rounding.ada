with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada;

procedure Rounding is
  n    : Integer := 1;
  a, b : Integer := 0;

begin
  Integer_Text_IO.Get(n);
  Text_IO.Skip_Line;

  while n > 0 loop
    Integer_Text_IO.Get(a);
    Integer_Text_IO.Get(b);
    Text_IO.Skip_Line;

    Integer_Text_IO.Put(Integer((Float(a) / Float(b))));

    n := n - 1;
  end loop;
  
end Rounding;