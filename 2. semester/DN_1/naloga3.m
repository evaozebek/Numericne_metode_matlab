F = @(x) (cos(2 + 2*x)).^2;
X = zeros(5,1);
Y = zeros(5,1);
%%%%%% naredimo x (delitev)%%%%
for i = 0:5
    X(i+1,1) = i/5;
end
%%%%%izračunamo vrednosti v podani x-ih %%%%%%
for i = 1:5
    Y(i,1) = F(X(i));
end
%%%%%%%%
[d, koef] = divdiff(X,F);


n1 = Newtonov_polinom(koef, X, 0.25);
n2 = Newtonov_polinom(koef, X, 0.95);

v1 = F(0.25);
v2 = F(0.95);

X1 = zeros(101,1);
for i = 0:100
    X1(i+1,1) = i/100;
end

R1 = zeros(101,1);
for i = 1:101
    R1(i) = abs(F(X1(i)) - Newtonov_polinom(koef, X, X1(i)));
end

razlika = max(R1);
    
    
    
    
    

