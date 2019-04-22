function[M, st_korakov]= QR_iter_dvojni(M, st_ponovitev, tol)
%M... Matirka ki jo reduciramo
%st_ponovitev... Kolikokrat maximalno ponovimo iteracijo
%tol... toleranca absolutne velikosti poddiagonalnih elementov
[a,b] = size(M);
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
    e = eig(M(a-1:a,a-1:a));
    
    [Q,R] = qr(M - e(1,1)*eye(a)); 
    M = R*Q + e(1,1)*eye(a);
    
    [Q,R] = qr(M - e(2,1)*eye(a));
    M = R*Q + e(2,1)*eye(a);
    
    T=1;
    k = k + 1;
    for i = 2:size(M)
        for j = 1:i-1
            if abs(M(i,j)) > tol
                T = 0;
            end
        end
    end
end
st_korakov = k;
    
    
    
    
    
