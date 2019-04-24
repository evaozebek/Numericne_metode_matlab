G = @(x) exp(-x + sin(10*x));
dG = @(x) exp(-x + sin(10*x))*(-1 + 10*cos(10*x));
X = zeros(7,1);
for i = 0:6
    X(i+1)= i/6;
end

 dX = zeros(7,1);
 for i = 1:7
     dX(i) = dG(X(i));
 end
 
 Y = zeros(7,1);
 for i = 1:7
     Y(i) = G(X(i));
 end
 
test = zeros(6,1);
for i = 1:6
    test(i) = ((X(i) + X(i+1))/2);
end

x = linspace(0,1);
p = pchip(X, Y);
pp = Hermit(X, Y, dX);



zs = ppval(pp, x);
plot(x, G(x), '--', x, zs, 'r', X,Y,'o')
testne_tocke = ppval(pp, test);

