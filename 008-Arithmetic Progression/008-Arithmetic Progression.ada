with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada;

procedure Arithmetic is
  cnt     : Integer := 1;
  a, b, n : Integer := 0;
  s       : Integer := 0;

begin
  Integer_Text_IO.Get(cnt);
  Text_IO.Skip_Line;

  while cnt > 0 loop
    Integer_Text_IO.Get(a);
    Integer_Text_IO.Get(b);
    Integer_Text_IO.Get(n);
    Text_IO.Skip_Line;

    s := ((2*a + (n-1)*b) * n) / 2;

    Integer_Text_IO.Put(s);
    cnt := cnt - 1;
  end loop;
  
end Arithmetic;
