function [x, X, k] = newton(f,Jf,x0, tol, N)
%Newtonowa metoda
%Posplošena tangentna metoda za veèdimenzionalne probleme
%f: preslikava
%Jf: Jacobijeva matrika preslikave
%x0: zaèetni približek
%tol: toleranca norme razlike dveh zaporednih korakov
%N: maksimalno stevilo korakov
%x: koncni priblizek
%X: matrika vseh pribizkov
%k: stevilo opravljenih korakov


k = 0;
X = x0;
dx = Inf;
while norm(dx) >= tol && k < N
    k = k+1;
    dx = Jf(X(:,k))\(-f(X(:,k)));
    X(:,k+1) = X(:,k) + dx;
end
x = X(:,k+1);


end

