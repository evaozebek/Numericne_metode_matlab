function [M,st_korakov] = QR_iter(M, st_ponovitev, tol)
%M... Matrika ki jo zelimo reducirati
%st_ponovitev... kolikokrat se iteracija ponovi
%tol... toleranca velikosti poddiagonalnih elementov


k = 1;
          
            
while k < st_ponovitev && any(abs(diag(M, -1)) >=tol)
    [Q,R] = qr(M);
    M = R*Q;
    k = k+1;
    
end
st_korakov = k;

end

