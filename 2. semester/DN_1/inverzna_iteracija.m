function [z] = inverzna_iteracija(A,z,st_korakov,zac_prbl, tol)
%A... matrika
%z... zaèetni vektor
%tol... toleranca
%zac_prbl... zacetni priblizek za lastno vrednost

A = A - zac_prbl*eye(size(A));
z = z/norm(z,2)
k=1;

while k<st_korakov && norm(A*z - zac_prbl*z,2) > tol
    y=A\z;
    z=y/norm(y,2);
    k=k+1;
end

