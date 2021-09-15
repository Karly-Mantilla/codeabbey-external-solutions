{procedure main}
procedure operations (heap, matches : integer; variation : string);
begin
  if (variation = ' n') then {validate rules(normal or inverted)}
    write (heap mod (matches + 1), ' ') {result according to normal rule}
  else 
    write ((heap - 1) mod (matches + 1), ' ') {result according to inverted rule}
end; 

procedure inputs; {data input}
var
  heap, matches : integer; {variable declaration}
  variation : string;
begin 
  read (heap, matches, variation); {data read}
  operations (heap, matches, variation); {send parameters to (operations)}
end;

procedure amount(start, max : integer);
begin
  inputs(); {call procedure to start}
  if start < max then {base case recursion}
    amount (start + 1, max)
end;

procedure run; {procedure initial with amount of iterations}
var
  max : integer;
begin
  readln(max); {first data to read, amount of test-cases}
  amount(1, max);
end;

begin
  run();{run program}
end.