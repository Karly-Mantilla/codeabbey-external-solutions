with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Fixed;

procedure codeabby26 is
  A,B,countA, countB,last : Natural := 0;
  sequence : string(1..1024);
  type numbers is array (positive range <>) of natural;
  input : numbers (1..2);
  
  
  function Substrings(Main: String; Sub: String) return Natural is
      Idx: Natural :=  Ada.Strings.Fixed.Index(Source => Main, Pattern => Sub);
  begin
    if Idx = 0 then
      return 0;
    else
      return 1 + Substrings(Main(Idx+Sub'Length .. Main'Last), Sub);
    end if;
  end Substrings;
   
  function parse(sequence : string; count: natural ) return numbers is
    old_i : integer := 1;
    my_index : integer := 1;
    my_number : numbers(1..count);
  begin
    for i in sequence'Range loop
      if sequence(i) = ' ' then
    my_number(my_index) := Natural'Value(sequence(old_i..i-1));
    old_i := i;
    my_index := my_index + 1;
      end if;
    end loop;
    if my_index = count then
      -- last value still missing
      my_number(my_index) := Natural'Value(sequence(old_i..sequence'Last));
    end if;
    return my_number;
  end parse;

  function gcd (A,B : natural) return natural is
    my_A : natural := A;
    my_B : natural := B;
  begin
    while my_A /= my_B loop
      if my_A > my_B then
    my_A := my_A - my_B;
      else
    my_B := my_B - my_A;
      end if;
    end loop;
    return my_A;
  end gcd;

  function lcm (A,B: Natural) return natural is
  begin
    return A * B / gcd(A, B);
  end;
    
begin
  Ada.Integer_Text_IO.Get(countA);
  Ada.Text_IO.Skip_Line;
  declare
    iterations : numbers(1..countA*2);
  begin
    countB := 1;
    while countA*2 >= countB loop
      Ada.Text_IO.Get_line(sequence,last);
      input := parse(sequence =>  sequence(1..last), count =>  Substrings(Main =>  sequence(1..last), Sub => " ") + 1);
      A := input(1);
      B := input(2);
      iterations(countB) := gcd(A,B);
      iterations(countB + 1) := lcm(A,B);
      countB := countB + 2;
    end loop;
    countB := 1;
    while countA*2 >= countB  loop
      Ada.Text_IO.Put("(");
      Ada.Integer_Text_IO.Put(iterations(countB),1);
      Ada.Text_IO.Put(" ");
      Ada.Integer_Text_IO.Put(iterations(countB + 1),1);
      Ada.Text_IO.Put(") ");
      countB := countB + 2;
    end loop;

  end;
  
end codeabby26;
  