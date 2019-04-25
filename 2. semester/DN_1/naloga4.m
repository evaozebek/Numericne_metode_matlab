G = @(x) exp(-x + sin(10*x)); %funkcija

dG = @(x) exp(-x + sin(10*x))*(-1 + 10*cos(10*x)); %odvod funkcije

X = zeros(7,1); %%%vektor x
for i = 0:6
    X(i+1)= i/6;
end

 dX = zeros(7,1); %%%%vektor vrednosti odvoda funkcije v točkah x
 for i = 1:7
     dX(i) = dG(X(i));
 end
 
 Y = zeros(7,1); %%%vrednost funkcije v točkah x
 for i = 1:7
     Y(i) = G(X(i));
 end
 
test = zeros(6,1);
for i = 1:6
    test(i) = ((X(i) + X(i+1))/2);
end

x = linspace(0,1); %interval x-ov, ki jih rabiš za risanje grafa
p = pchip(X, Y); % če nimaš odvodov
pp = Hermit(X, Y, dX); % če imaš odovode



zs = ppval(pp, x);
plot(x, G(x), '--', x, zs, 'r', X,Y,'o')
testne_tocke = ppval(pp, test);

