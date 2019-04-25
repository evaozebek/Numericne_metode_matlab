function [z,e,k] = potencna_iteracija(A, z, st_korakov, tol)
%A... Matrika v kateri išèemo lastne vrednosti


z = z/norm(z,2);
y = A*z;
e = z'*y;
k = 0;
while norm(y - e*z,2) > tol && k < st_korakov
    y = A*z;
    e = z'*y;
    k = k + 1;
    z = y / norm(y,2);
end
end