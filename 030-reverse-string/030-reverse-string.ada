with Ada.Text_IO;
use  Ada.Text_IO;

procedure ReverseString is

  l : Integer;
  s : String(1..120);
  t : Character;
  i : Integer := 1;
  j : Integer;

begin
  Get_Line(s, l);
  j := l;

  loop
    t := s(i);
    s(i) := s(j);
    s(j) := t;
    i := i + 1;
    j := j - 1;
    exit when i >= j;
  end loop;
 
  Put_Line(s(1..l));
end ReverseString;