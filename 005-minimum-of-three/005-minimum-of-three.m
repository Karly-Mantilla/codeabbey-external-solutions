for i= 1:length(A)
if A(i,1)<A(i,2)&&A(i,1)<A(i,3)
    C(i,1)=A(i,1);
elseif A(i,2)<A(i,1)&&A(i,2)<A(i,3)
    C(i,1)=A(i,2);
else
    C(i,1)=A(i,3);
end
i=i+1;
end