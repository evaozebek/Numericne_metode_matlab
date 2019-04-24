function [M,st_korakov] = QR_iter_enojni(M, st_ponovitev, tol)
%M... matrika ki jo zelis reducirati
%st_ponovitev... kolikokrat ponovis iteracijo
%tol... toleranca absolutne velikosti poddiagonalnih elementov

k = 0;

while k < st_ponovitev && any(abs(diag(M, -1)) >=tol)
    [a,b] = size(M);
    premik = M(a,a);
    [Q,R] = qr(M - premik*eye(a));
    M = R*Q;
    M = M + premik*eye(a);
    k = k+1;
    
end
st_korakov = k;
    