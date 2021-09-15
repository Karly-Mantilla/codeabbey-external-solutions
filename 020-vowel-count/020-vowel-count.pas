procedure value();
type
  vector = array[1..100] of String;
var
  vec: vector;
  poss: string;
  tot, eraser: integer;
const
  count: integer = 0;

begin
  readln(vec[count]);
  tot := length(vec[count]);
  poss := vec[count];
  repeat
    eraser := Pos('a', vec[count]);
    Delete(vec[count], eraser, 1);
  until(Pos('a', vec[count]) = 0);
  repeat
    eraser := Pos('e', vec[count]);
    Delete(vec[count], eraser, 1);
  until(Pos('e', vec[count]) = 0);
  repeat
    eraser := Pos('i', vec[count]);
    Delete(vec[count], eraser, 1);
  until(Pos('i', vec[count]) = 0);
  repeat
    eraser := Pos('o', vec[count]);
    Delete(vec[count], eraser, 1);
  until(Pos('o', vec[count]) = 0);
  repeat
    eraser := Pos('u', vec[count]);
    Delete(vec[count], eraser, 1);
  until(Pos('u', vec[count]) = 0);
  repeat
    eraser := Pos('y', vec[count]);
    Delete(vec[count], eraser, 1);
  until(Pos('y', vec[count]) = 0);
  write(tot - length(poss), ' ');
end;

function loop(val:longint): longint;
begin
  if val = 1 then
    loop := 1
  else
    loop := loop(val - 1);
    value();
end;

procedure read();
const
  num: integer = 0;
begin
  readln(num);
  loop(num);
end;

begin
  read();
end.
