function [x, L, U] =  lusolve(A, b);
%A: kvadratna matrika
%b: vektor desne strani sistema
%x: resitev sistema A+x = b
% L, U: matriki LU razcepa A (A = L*U)
%LU razcep
n = size(A,1);
L = eye(n);
for j = 1: n-1
    for i = j+1:n
        L(i,j) = A(i,j) / A(j,j);
        for k = j+1:n
            A(i,k) = A(i,k) - L(i,j)*A(j,k);       
        end
    end
end

U = triu(A);

%prema substitucija za resevanje sistema L*y=b
y = L\b;

%obratna substitucija za resevanje sistema u*x = y
x = U\y;

end

