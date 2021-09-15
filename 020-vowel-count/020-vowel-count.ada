with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada;

procedure VowelCount is

  function Is_Vowel(c : in Character) return Boolean is
  begin
    case c is
      when 'a' | 'e' | 'i' | 'o' | 'u' | 'y' 
        => return true;
      when others => return false;
    end case;
  end Is_Vowel;

  function VCount(s : String) return Integer is
    count : Integer := 0;
  begin
    for i in s'Range loop
      if Is_Vowel(s(i)) then
        count := count + 1;
      end if;
    end loop;
    return count;
  end VCount;

  q : Integer;
  buffer : String(1..1024);
  last   : Integer;
  cnt    : Integer;

begin
  Integer_Text_IO.Get(q);
  Text_IO.Skip_Line;

  for i in 1..q loop
    Text_IO.Get_Line(buffer, last);
    cnt := VCount(buffer(1..last));
    Integer_Text_IO.Put(cnt);
  end loop;
end VowelCount;
