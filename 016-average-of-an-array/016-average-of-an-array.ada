with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure codeabby16 is
  type numbers is 
    array (positive range <>) of integer;
  type input_line is
    record
      length : positive;
      vector : numbers(1..100);
    end record;  
  count : positive := 1;

  procedure fetch(vector : out input_line) is
    fetched_number : integer;
    length : positive := 1;
  begin
    Read: loop
      Ada.Integer_Text_IO.Get(fetched_number);
      exit Read when fetched_number = 0;
      vector.length := length;
      vector.vector(length) := fetched_number;
      length := length + 1;
    end loop Read;
    Ada.Text_IO.Skip_Line;
  end fetch;

  function average(vector : input_line) return integer is
    average : integer := 0;
  begin
    for i in 1..vector.length loop
      average := average + vector.vector(i);
    end loop;
    return Integer(Float'Rounding(Float(average)/Float(vector.length)));
  end average;

  procedure iterate(count : integer) is
    result : numbers(1..count);
    vector : input_line;
  begin
    for i in 1..count loop
      fetch(vector);
      result(i) := average(vector);
    end loop;
    for i in 1..count loop
      Ada.Text_IO.Put (Integer'Image(result(i)));
    end loop;
  end iterate;
      
begin
  Ada.Integer_Text_IO.Get (count);
  Ada.Text_IO.Skip_Line;
  iterate(count);
end codeabby16;