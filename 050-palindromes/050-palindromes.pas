Program lewis9804;

uses RegExpr, strUtils;

function palin(num1 : integer) : string;
var 
  values : string;
  revert: string;
  boole: string = 'N';
begin
  readln(values);
  RegExpr.RegExprModifierI := True; 
  values := ReplaceRegExpr('[^a-z]', values, '', True);
  values := LowerCase(values);
  if(values = ReverseString(values)) then boole := 'Y';
  if (num1 = 1) then
    palin := boole
  else 
    palin := boole + ' ' + palin(num1 - 1);
end;

procedure main();
var
  quantity : String;
  intQuantity : integer;
begin
  Readln(quantity);
  Val(quantity, intQuantity);
  writeln(palin(intQuantity));
end;

begin
  main();
end.