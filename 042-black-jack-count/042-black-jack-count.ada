with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings;
with Ada.Strings.Unbounded;

use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Strings.Unbounded;

procedure codeabby42 is
  subtype counter is Integer range 1..100;
  subtype cards is Integer range 1..11;
  count : counter;
  aces, temp : Natural := 0;
  incoming : Character;
  result : Unbounded_String;

  function to_number (incoming : Character) return cards is
  begin
    if Character'Pos(incoming) > 49 and Character'Pos(incoming) <= 57 then
      return Character'Pos(incoming) - 48;
    elsif incoming = 'A' then
      return 1;
    else 
      return 10;
    end if;
  end to_number;

  function is_ace (incoming : Character) return Boolean is
  begin
    if incoming = 'A' then
      return True;
    else
      return False;
    end if;
  end is_ace;

  function calc_win (sum, aces : Natural) return Unbounded_String is
    result : Unbounded_String;
    counted_ace : Natural := aces;
    temp : Natural := sum;
  begin
    if temp > 21 then
      Append(result," Bust");
    else
      while counted_ace /= 0 loop
    if temp + 10 <= 21 then
      temp := temp + 10;
      counted_ace := counted_ace - 1;
    else
      counted_ace := 0;
    end if;
      end loop;
      Append(result,Natural'Image(temp));
    end if;
    return result;
  end calc_win;
  
begin
  Get(count);
  Skip_Line;
  for i in 1..count loop
    while not End_Of_Line loop
      Get(incoming);
      if incoming /= ' ' then
    temp := temp + to_number(incoming);
    if is_ace(incoming) then
      aces := aces + 1;
    end if;
      end if;
    end loop;
    Append(result,calc_win(temp,aces));
    Skip_Line;
    temp := 0;
    aces := 0;
  end loop;
  Put_Line(To_String(result));
end codeabby42;