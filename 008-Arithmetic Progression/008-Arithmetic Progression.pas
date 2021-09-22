Var 
  i, FirstNum, Step, Count, Sum, Curr : Integer;
  StrLine, StrN: String;
  F: TextFile;
  
Begin
  AssignFile(f, 'Input.txt');
  Reset(f);
  Readln(f, StrN);
  
  while not(eof(f)) do
  begin
    i := 1;
    Readln(f, StrLine);
    
    FirstNum := StrToInt(Copy(StrLine, 0, pos(' ', StrLine)));
    Delete(StrLine, 1, pos(' ', StrLine));
    Step := StrToInt(Copy(StrLine, 0, pos(' ', StrLine)));
    Delete(StrLine, 1, pos(' ', StrLine));
    Count := StrToInt(Copy(StrLine, 0, Length(StrLine)));
    Sum := FirstNum;
    Curr := FirstNum;
    Repeat
      if i <> 1 then    
        Sum := Sum + Curr;
      Curr := Curr + Step;
      inc(i);
    until Count + 1 = i;
    Write(Sum, ' ');
  end;
  CloseFile(f);
End.