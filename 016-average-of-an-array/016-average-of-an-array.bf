program problem_16;
var
    A,S,R,i,m,B: longint;
    P,f: real;
begin
    m:=0;
    S:=0;
    readln(R);
    for i:=1 to R do            
    begin    
        read(A);
        while A<>0 do 
        begin
            S:=S+A;
            read(A);
            m:=m+1;
        end;       
        
        P:=S/m;
        S:=0;
        m:=0;
        
        if P>=0 then B:=trunc(P+0.5)
        else 
        begin
           B:=trunc(P);
           f:=P-B;
           if f<-0.5 then B:=B-1;
        end;
        write(B,' ');
    end;

end.