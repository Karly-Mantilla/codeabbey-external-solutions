with Ada.Text_IO;
with Ada.Integer_Text_IO;
with GNATCOLL.GMP;
with GNATCOLL.GMP.Integers;
with GNATCOLL.GMP.Integers.IO;

-- gnatmake -aI/usr/share/ada/adainclude/gnatcoll \
-- -aO/usr/lib/x86_64-linux-gnu/ada/adalib/gnatcoll \
-- -aI/usr/share/ada/adainclude/gnatcoll_gmp \
-- -aO/usr/lib/x86_64-linux-gnu/ada/adalib/gnatcoll_gmp \
-- codeabby128.adb -largs -lgnatcoll_gmp

procedure codeabby128 is
  count, N, K : Natural := 1;
  type big_numbers is array (positive range <>) of GNATCOLL.GMP.Integers.Big_Integer;
  
  procedure factorial (N : in Natural; result : in out GNATCOLL.GMP.Integers.Big_Integer) is
    N_intern,temp : GNATCOLL.GMP.Integers.Big_Integer;
  begin
    GNATCOLL.GMP.Integers.set(N_intern,GNATCOLL.GMP.Long(N));
    if N <= 1 then
      GNATCOLL.GMP.Integers.set(result,1);
    else
      factorial(N - 1,temp);
      GNATCOLL.GMP.Integers.set(result,GNATCOLL.GMP.Integers."*"(N_intern,temp));
    end if;
  end factorial; 

  procedure combinations (N, K : in Natural; result : in out GNATCOLL.GMP.Integers.Big_Integer) is
    NK : Natural := N - K;
    N_Res,K_Res,NK_Res : GNATCOLL.GMP.Integers.Big_Integer;
  begin
    factorial(N,N_Res);
    factorial(K,K_Res);
    factorial(NK,NK_Res);
    GNATCOLL.GMP.Integers.set(result,GNATCOLL.GMP.Integers."/"(N_Res,GNATCOLL.GMP.Integers."*"(K_Res, NK_Res)));
  end combinations;
  
begin
  Ada.Integer_Text_IO.Get(count);
  Ada.Text_IO.Skip_Line;
  declare
    result : big_numbers(1..count);
  begin
    for i in 1..count loop
      Ada.Integer_Text_IO.Get(N);
      Ada.Integer_Text_IO.Get(K);
      Ada.Text_IO.Skip_Line;
      combinations(N,K,result(i));
    end loop;
    for i in 1..count loop
      GNATCOLL.GMP.Integers.IO.Put(result(i));
      Ada.Text_IO.Put(" ");
    end loop;
  end;
end codeabby128;
