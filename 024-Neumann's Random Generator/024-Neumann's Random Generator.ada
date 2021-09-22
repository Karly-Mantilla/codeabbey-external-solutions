with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Fixed;

procedure codeabby24 is
  iterations,count,last,tortoise,hare,lambda,mu : Natural := 0;
  sequence : string(1..1024);
  type numbers is array (positive range <>) of natural;
  
  
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

  function random_number(seed : integer) return integer is
    interim : integer := 0;
  begin
    interim := seed ** 2 / 100;
    return interim mod 10000;
  end random_number;
  
begin
  Ada.Integer_Text_IO.Get(count);
  Ada.Text_IO.Skip_Line;
  Ada.Text_IO.Get_line(sequence,last);
  declare
    initial_seeds : numbers ( 1..count) := parse(sequence =>  sequence(1..last), 
                         count =>  Substrings(Main =>  sequence(1..last), Sub => " ") + 1);
  begin   
    for i in 1..count loop
      -- tortoise and the hare algorithm: https://en.wikipedia.org/wiki/Cycle_detection
      tortoise := random_number(initial_seeds(i));
      hare := random_number(tortoise);

      -- start race hare is faster as tortoise hare will find the repetive number:
      while tortoise /= hare loop
    tortoise := random_number(tortoise);
    hare := random_number(random_number(hare));
      end loop;

      -- Find the initial position of first repetition.
      mu := 0;
      tortoise := initial_seeds(i);
      while tortoise /= hare loop
        tortoise := random_number(tortoise);
        hare := random_number(hare); -- Hare and tortoise move at same speed
    mu := mu + 1;
      end loop;

      -- Find the length of repetition cycle
      lambda := 1;
      hare := random_number(tortoise);
      while tortoise /= hare loop
    hare := random_number(hare);
    lambda := lambda + 1;
      end loop;

      iterations := lambda + mu;
      Ada.Integer_Text_IO.Put(iterations,1);
      Ada.Text_IO.Put(" ");

    end loop;
  end;
end codeabby24;
  