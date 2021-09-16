%este programa encuentra mcm y MCD de 2 numeros 
% //PROGRAMADO EN MATLAB//

t=input('numero de casos: ');
x=input('ingrese los datos: ');
fprintf('\n')
M=zeros(1,t);

for i=1:t
    v=x(i,:); d=v;
    while v(1)~=v(2)
        if (v(1)==max(v))
            v(1)=v(1)-v(2);
        else
            v(2)=v(2)-v(1);
        end
    end
    
    MCD=v(1);
    mcm=(d(1)*d(2))/MCD;
    
    fprintf(' (%.d %.d) ',MCD,mcm) 
end
fprintf('\n')