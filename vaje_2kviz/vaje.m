D = load('cryptomarket.csv');

T = D(15:end , 1:10);

norm(T)

b = [49366; 49474; 49932; 49937; 49928; 49783; 50078; 50467; 50434; 50957];

x = T\b;
norm(x,1)

[x1, L, U] = lusolve(T, b);
norm(U,inf)

[L1, U1, P] = lu(T);
norm(L1, 'fro')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = @(x)[x(1)^2 + x(2)^2 - 4 ; x(1)^2 - x(2)^2 - 1];
Jf = @(x) [2*x(1) 2*x(2); 2*x(1) -2*x(2)];
x0= zeros(2,1);
x0(1) = input('Vnesi približek za x koordinato:');
x0(2) = input('Vnesi približek za y koordinato:');
[x, X, k] = newton(f, Jf, x0, 1e-12, 100);

oddaljenost = sqrt(x(1)^2 + x(2)^2);
oddaljenost;

f1 = @(x)[x(1)^2+x(2)^2+x(3)^2-1;2*x(1)^2+x(2)^2-4*x(3);3*x(1)^2-4*x(2)+x(3)^2];
Jf1 = @(x) [2*x(1) 2*x(2) 2*x(3);4*x(1) 2*x(2) -4;6*x(1) -4 2*x(3)];
x01= zeros(3,1);
x01(1) = 1;
x01(2) = 0;
x01(3) = 0;
[x1, X1, k1] = newton(f1, Jf1, x01, 1e-12, 100);

a = X1(:,4);
sqrt(a(1)^2 + a(2)^2 + a(3)^2)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

D = load('dot-com.csv');
X = D(195:940,1);
Y = D(195:940,2);
hold on
plot(X,Y);
A = [X.^2 , X.^1 , X.^0];
b = Y;
a = (A'*A)\(A'*b);

plot(X, polyval(a, X))

polyval(a, X(400))


[Q,R] = qr(A);
a1 = R\(Q'*b);

b1 = log(Y);

a = (A'*A)\(A'*b1);

f = @(b,x) exp(b(1) * x.^2 + b(2)*x + b(3));
plot(X,f(a,X),'g')

f(a,X(400))

b0 = A\log(Y);

FUN = @(b) norm(f(b,X)-Y)^2;
b3 = fminsearch(FUN, b0);
plot(X, f(b3, X));

polyval(b3, X(400))

f(b3, X(400))