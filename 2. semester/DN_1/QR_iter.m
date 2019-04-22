function [M,st_korakov] = QR_iter(M, st_ponovitev, tol)
%M... Matrika ki jo zelimo reducirati
%st_ponovitev... kolikokrat se iteracija ponovi
%tol... toleranca velikosti poddiagonalnih elementov


k = 1;
T=1
for i = 2:size(M)
    for j = 1:i-1
        if abs(M(i,j)) > tol
            T = 0;
        end
    end
end
            
            
while k < st_ponovitev && T == 0
    [Q,R] = qr(M);
    M = R*Q;
    k = k+1;
    T=1;
    for i = 2:size(M)
        for j = 1:i-1
            if abs(M(i,j)) > tol
                T = 0;
            end
        end
    end
end
st_korakov = k;

end

