with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Maps;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;

procedure Codeabby50 is
  count,length,index, n : Natural := 1;
  letter : character;
  palindrom,temp, result : Ada.Strings.Unbounded.Unbounded_String;
  space,special_chars : string(1..8);
  special_mapping : Ada.Strings.Maps.Character_Mapping;
begin
  Ada.Integer_Text_IO.get(count);
  Ada.Text_IO.Skip_Line;
  special_chars := ",.?-;:!_";
  space         := "        ";
  special_mapping := Ada.Strings.Maps.To_Mapping(special_chars, space);
  for i in 1..count loop
    palindrom := Ada.Strings.Unbounded.Text_IO.Get_Line;
    -- lower case
    Ada.Strings.Unbounded.Translate(Source => palindrom, Mapping => Ada.Strings.Maps.Constants.Lower_Case_Map);
    Ada.Strings.Unbounded.Translate(Source => palindrom, Mapping => special_mapping);
    kill_whitespace : loop
      index := Ada.Strings.Unbounded.Index(Source => palindrom, Pattern => " ");
      exit kill_whitespace when index = 0;
      Ada.Strings.Unbounded.Delete(Source => palindrom, From => index, Through => index);
    end loop kill_whitespace;

    length := Ada.Strings.Unbounded.Length(Source => palindrom);
    temp := palindrom;
    n := 1;
    -- turnaround like challenge 30
    while n < length loop
      letter := Ada.Strings.Unbounded.Element(Source => temp, Index => n);
      Ada.Strings.Unbounded.Replace_Element(Source => temp, Index => n, By => Ada.Strings.Unbounded.Element(Source => temp, Index => length));
      Ada.Strings.Unbounded.Replace_Element(Source => temp, Index => length, By => letter);
      length := length - 1;
      n := n+1;
    end loop;

    if Ada.Strings.Unbounded."="(temp,palindrom) then
      Ada.Strings.Unbounded.Append(result,"Y ");
    else
      Ada.Strings.Unbounded.Append(result,"N ");
    end if;
  end loop;
  Ada.Strings.Unbounded.Text_IO.Put_Line(result);
end Codeabby50;