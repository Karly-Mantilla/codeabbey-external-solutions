with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Strings.Unbounded;

use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Strings.Unbounded;

procedure codeabby39 is
  type nominal is array (Positive range <>) of Natural;
  count : Positive;
  alpha : Character;
  shares : Unbounded_String;
  nominals : nominal(1..14);
  sum : Natural := 0;
  mean,squaresum,varianz,comission : Float := 0.0;
  package math is new Ada.Numerics.Generic_Elementary_Functions(Float);
  result : Unbounded_String;
begin
  Get(count);
  Skip_Line;
  for i in 1..count loop
    shares := To_Unbounded_String("");
    squaresum := 0.0;
    sum := 0;
    for i in 1..4 loop
      Get(alpha);
      Append(shares,alpha);
    end loop;
    for i in 1..14 loop
      Get(nominals(i));
      sum := sum + nominals(i);
    end loop;
    Skip_Line;
    mean := Float(sum) / 14.0;
    for i in 1..14 loop
      squaresum := squaresum + ( mean - Float(nominals(i)) ) ** 2;
    end loop;
    varianz := math.sqrt(squaresum / 14.0);
    comission := mean * 0.04;
    if comission <= varianz then
      Append(result,shares);
      Append(result," ");
    end if;
  end loop;
  Put_Line(To_String(result));
end codeabby39;
