clear
clc

function H = ap(m)
  x = m(:,1);
  y = m(:,2);
  z = m(:,3);
  s = length(x);
  H = []
  for i = 1:s
    e = x+(z-1).*y;
    c = z./2.*(x+e);
  endfor
  H = [H c]
endfunction