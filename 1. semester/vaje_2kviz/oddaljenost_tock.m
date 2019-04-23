function [d] = oddaljenost_tock(x,y)
%d = oddaljenost
%x = krajevni vektor tocke
%y = krajevni vektor tocke

d = 0;

for i = 1:length(x)
    d =+ (x(i) - y(i)) ^2;
end
d = sqrt(d);
