var 
  A, B, C, Res: Array[1..100] of Integer;
  N, I: Integer;
  StrLine: String;
  F: TextFile;
Begin
  i := 1;
  Readln(N);
  
  AssignFile(f, 'Input.txt');
  Reset(f);
  while not(Eof(f)) do
  begin
    Readln(f, StrLine);
    A[i] := StrToInt(Copy(StrLine, 0, pos(' ', StrLine)-1));
    Delete(StrLine, 1, pos(' ', StrLine));
    B[i] := StrToInt(Copy(StrLine, 0, pos(' ', StrLine)-1));
    C[i] := StrToInt(Copy(StrLine, pos(' ', StrLine)+1, Length(StrLine)- pos(' ', StrLine)+1));
    if (A[i] < B[i]) and (A[i] < C[i]) then
      Res[i] := A[i]
    else if (B[i] < A[i]) and (B[i] < C[i]) then
      Res[i] := B[i]
    else
      Res[i] := C[i];3
    inc(i);
  end;
  for i:= 1 to N do
  begin
    Write(Res[i], ' ');
  end;
  CloseFile(f);
End.