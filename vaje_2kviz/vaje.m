D = load('cryptomarket.csv'); %nalozis datoteko

T = D(15:end , 1:10); %izberes dimenzijo/podtabelo s katero delas

norm(T)%2. norma

b = [49366; 49474; 49932; 49937; 49928; 49783; 50078; 50467; 50434; 50957];%imas podan

x = T\b; %vgrajena funkcija za resevanje problemov Ax=b
norm(x,1)

[x1, L, U] = lusolve(T, b);%LU razcep, x1 te zanima
norm(U,inf)

[L1, U1, P] = lu(T); %vgrajena funkcija ki ti poda LU razecp. ce nisi ziher, v konzolo napisi: help lu. tam mas se extra navodila
norm(L1, 'fro')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = @(x)[x(1)^2 + x(2)^2 - 4 ; x(1)^2 - x(2)^2 - 1]; % funkciji ki ju zelis resiti/primerjati
Jf = @(x) [2*x(1) 2*x(2); 2*x(1) -2*x(2)];% jacobijeva matrika, z ';' gres v novo vrstico, med odvodi delaj presledke, drugace NE
x0= zeros(2,1); %ce ze ves kaksen je x0, ga vnesi noter, tako kot mam pri naslednji nalogi
x0(1) = input('Vnesi približek za x koordinato:'); %input, ki ti bo v konzolo dal moznost da vpises priblizek
x0(2) = input('Vnesi približek za y koordinato:');% enako, samo za 2. koordinato
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
plot(X,Y); %ni nujno da mas notri, to ti samo narise tvoj graf
A = [X.^2 , X.^1 , X.^0]; %matrika A ki jo rabis za resevanje predolocenih sistemov
b = Y;
a = (A'*A)\(A'*b);

plot(X, polyval(a, X))%to ti narise tvojo resitev, ki je v obliki polinoma

polyval(a, X(400))% a je vektor koeficientov, ki ti jih ta funkcija preuredi v polinom ustrezne stopnje.
%X(400) je vrednost iz tabele, ker te zanima vrednost polinoma v tej tocki


[Q,R] = qr(A);%vgrajena funkcija ki ti vrne QR razcep A
a1 = R\(Q'*b);%a1 je vektor koeficientov, ki jihh dobis po tem nacinu resevanja

b1 = log(Y);%tako na vsaki komponenti Y uporabis logaritem od e

a = (A'*A)\(A'*b1);

f = @(b,x) exp(b(1) * x.^2 + b(2)*x + b(3)); %funkcija, v odvisnosti od vektorja resitev in od x v katerem ti izracuna resitev
plot(X,f(a,X),'g')

f(a,X(400))

b0 = A\log(Y);
%vgajena funkcija za resevanje teh problemov, samo skopiraj in spremeni
%imena vetorjev
FUN = @(b) norm(f(b,X)-Y)^2;
b3 = fminsearch(FUN, b0);
plot(X, f(b3, X));

polyval(b3, X(400))%vrednost polinoma s temi koeficienti, mislim da pri tej nalogi ne rabis tega.

f(b3, X(400))%vrednost funkcije