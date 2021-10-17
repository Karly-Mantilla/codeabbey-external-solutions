with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;

use Ada;

procedure codeabby94 is
  count, input : Positive := 1;
  temp : Natural;
  result : Strings.Unbounded.Unbounded_String;
begin
  Integer_Text_IO.Get(count);
  Text_IO.Skip_Line;
  for i in 1..count loop
    temp := 0;
    while not Text_IO.End_Of_Line loop
      Integer_Text_IO.Get(input);
      temp := temp + input ** 2;
    end loop;
    Text_IO.Skip_Line;
    Strings.Unbounded.Append(result,Natural'Image(temp));
    Strings.Unbounded.Append(result," ");
  end loop;
  Strings.Unbounded.Text_IO.Put_Line(result);
end codeabby94;