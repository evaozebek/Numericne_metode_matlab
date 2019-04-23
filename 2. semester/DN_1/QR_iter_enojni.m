function [M,st_korakov] = QR_iter_enojni(M, st_ponovitev, tol)
%M... matrika ki jo zelis reducirati
%st_ponovitev... kolikokrat ponovis iteracijo
%tol... toleranca absolutne velikosti poddiagonalnih elementov

k = 1;

while k < st_ponovitev && any(abs(diag(M, -1)) >=tol)
    [a,b] = size(M);
    [Q,R] = qr(M - M(a,a)*eye(a));
    M = R*Q;
    k = k+1;
    
end
st_korakov = k;
    