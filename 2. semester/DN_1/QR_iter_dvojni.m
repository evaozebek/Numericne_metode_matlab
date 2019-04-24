function[M, st_korakov]= QR_iter_dvojni(M, st_ponovitev, tol)
%M... Matirka ki jo reduciramo
%st_ponovitev... Kolikokrat maximalno ponovimo iteracijo
%tol... toleranca absolutne velikosti poddiagonalnih elementov
[a,b] = size(M);
k = 1;
while k < st_ponovitev && any(abs(diag(M, -1)) >=tol)
    e = eig(M(a-1:a,a-1:a));
    
    [Q,R] = qr(M - e(1,1)*eye(a)); 
    M = R*Q + e(1,1)*eye(a);
    
    [Q,R] = qr(M - e(2,1)*eye(a));
    M = R*Q + e(2,1)*eye(a);
    
    k= k+1;
    
end
st_korakov = k;
    
    
    
    
    
