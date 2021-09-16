with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada;

procedure TriangleArea is

type Point is record
  x, y : Float;
end record;

type Triangle is record
  A, B, C : Point;
end record;

function TArea(t : in Triangle) return Float is
begin
  return 0.5*abs((t.B.x - t.A.x)*(t.C.y - t.A.y) - (t.B.y - t.A.y)*(t.C.x - t.A.x));
end TArea;

  eps  : constant Float := 1.0e-7;
  q    : Integer;
  
begin
  Integer_Text_IO.Get(q);
  Text_IO.Skip_Line;

  for i in 1..q loop
    declare
       tr  : Triangle;
       ar  : Float;
    begin
      Float_Text_IO.Get(tr.A.x);
      Float_Text_IO.Get(tr.A.y);
      Float_Text_IO.Get(tr.B.x);
      Float_Text_IO.Get(tr.B.y);
      Float_Text_IO.Get(tr.C.x);
      Float_Text_IO.Get(tr.C.y);
      Text_IO.Skip_Line;

      ar := TArea(tr);

      if abs(ar - Float(Integer(ar))) < eps then
        Integer_Text_IO.Put(Integer(ar), width => 1);
      else
        Float_Text_IO.Put(ar, Aft => 1, Exp => 0);
      end if;
    end;
    Text_IO.Put(" ");
  end loop;
end TriangleArea;