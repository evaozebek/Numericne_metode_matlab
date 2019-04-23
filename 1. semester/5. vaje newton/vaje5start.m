clf
hold on
x = linspace(-2, 2, 100);
y = linspace(-2, 2, 100);
[x,y] = meshgrid(x,y);

contour(x, y, x.^2 + y.^2 - 4, [0 0]);
contour(x, y, x.^2 - y.^2 - 1, [0 0]);
axis equal
hold off

x0= zeros(2,1);
x0(1) = input('Vnesi približek za x koordinato:');
x0(2) = input('Vnesi približek za y koordinato:');

f = @(x) [x(1)^2 + x(2)^2 - 4; x(1)^2 - x(2)^2 - 1];
Jf = @(x) [2*x(1) 2*x(2) ; 2*x(1) -2*x(2)];

[x, X, k] = newton(f, Jf,x0, 1e-12, 100)

