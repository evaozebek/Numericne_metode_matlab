D = load('dot-com.csv');

X = D(195:940,1);
Y = D(195:940,2);

x1 = D(:,1);
y1 = D(:,2);
plot(x1, y1)
test_funkcije(10,D)


clf
hold on
plot(X,Y);

A = ones(length(X), 3);
for i = 1:length(X)
    A(i,1) = (X(i))^2;
    A(i,2) = X(i);
end

%resevanje predolocenega sistema preko normalnega sistema

A = [X.^2, X.^1, X.^0];
b = Y;
a = (A'*A)\(A'*b);

x = X;
plot(x,polyval(a,x))


    
%resevanje preko qr razcepa:
[Q,R] = qr(A);
a1 = R\(Q'*b);

b1 = log(Y);

a = (A'*A)\(A'*b1);

f = @(b,x) exp(b(1) * x.^2 + b(2)*x + b(3));
plot(X,f(a,X),'g');

hold off


%tocna resitev
%FUN = @(b) norm (f(b,X) - Y)^2;
%b2 = fminsearch(FUN, b1);
%plot(X, f(b2,x), 'm')










