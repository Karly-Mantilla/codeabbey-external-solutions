Program lewis9804;

uses strutils;

procedure main();
var
  quantity : String;
begin
  Readln(quantity);
  writeln(ReverseString(quantity));
end;

begin
  main();
end.