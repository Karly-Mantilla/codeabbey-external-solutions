function T =King_and_Queen(x,y)
  x =input('total baris=');   
  y =input('data=');
  w =double(y);
  for i=1:x;
    a =(w(i,1))-(w(i,3));
    b =(w(i,2))-(w(i,4));
    if a == 0;
      g='Y';
    elseif b == 0;
      g='Y';
    elseif abs(a) == abs(b);
      g='Y';
    else 
      g='N'
      
    endif
  end
  T =([g(1:i)])
  
end