with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings;
with Ada.Strings.Unbounded;

procedure codeabby31 is
  subtype my_counter is integer range 0..1000000;
  subtype my_index is integer range -1000000..1000000;
  word, result : Ada.Strings.Unbounded.Unbounded_String;
  number,last, i, n : my_counter := 1;
  index : my_index;
begin
  Ada.Integer_Text_IO.Get(number);
  for n in 1..number loop
    Ada.Integer_Text_IO.Get(index);
    word :=  Ada.Strings.Unbounded.Trim(Ada.Strings.Unbounded.To_Unbounded_String(Source => Ada.Text_IO.Get_line),Ada.Strings.Left);
    last := Ada.Strings.Unbounded.Length(word);
    if index >= 0 then
      Ada.Strings.Unbounded.Append(result ,Ada.Strings.Unbounded.Unbounded_Slice(word, index + 1, last));
      Ada.Strings.Unbounded.Append(result ,Ada.Strings.Unbounded.Unbounded_Slice(word, 1, index));
      Ada.Strings.Unbounded.Append(result ," ");
    else
      Ada.Strings.Unbounded.Append(result,Ada.Strings.Unbounded.Unbounded_Slice(word, last + index + 1, last));
      Ada.Strings.Unbounded.Append(result,Ada.Strings.Unbounded.Unbounded_Slice(word, 1, last + index));
      Ada.Strings.Unbounded.Append(result," ");
    end if;
  end loop;
  Ada.Text_IO.Put_Line(Ada.Strings.Unbounded.To_String(result));
end codeabby31;