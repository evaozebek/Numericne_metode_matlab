function [z] = inverzna_iteracija(A,z,st_korakov,zac_prbl)
%A... matrika
%z... zaèetni vektor
%tol... toleranca
%zac_prbl... zacetni priblizek za lastno vrednost
A = A - zac_prbl*eye(size(A));
k=1;
while k<st_korakov
    y=A\z;
    z=y/norm(y,2);
    k=k+1;
end

