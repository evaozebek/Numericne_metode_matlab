function [M,st_korakov] = QR_iter_enojni(M, st_ponovitev, tol)
%M... matrika ki jo zelis reducirati
%st_ponovitev... kolikokrat ponovis iteracijo
%tol... toleranca absolutne velikosti poddiagonalnih elementov

k = 1;
T=1;
for i = 2:size(M)
    for j = 1:i-1
        if abs(M(i,j)) > tol
            T = 0;
        end
    end
end

while k < st_ponovitev && T == 0
    [a,b] = size(M);
    [Q,R] = qr(M - M(a,a)*eye(a));
    M = R*Q;
    k = k+1;
    T = 1;
    for i = 2:size(M)
        for j = 1:i-1
            if abs(M(i,j)) > tol
                T = 0;
            end
        end
    end
end
st_korakov = k;
    