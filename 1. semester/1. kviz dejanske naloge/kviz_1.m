
b = 4; t = 4; L = -4; U = 4;

a = 56/101

c = 0:b -1;
M = zeros ( b ^t ,1) ;
i = 1;
for c1 = c
    for c2 = c
        for c3 = c
            for c4 = c
                M(i) = (b .^ -(1: t ) ) *[ c1 ; c2 ; c3 ; c4 ];
                i = i +1;
            end
        end
    end
end

d = U - L +1;
bm = b ^( t -1) ;
Xpn = zeros (( b -1) * bm , d ) ;
for i = 0: d -1
    Xpn (: , i +1) = M ( bm +1: end) * b ^( L + i ) ;
end
Xpn = Xpn (:) ;
Xn = [- Xpn( end : -1:1) ; Xpn ];


Xpd = M (2: b ^( t -1) ) * b ^ L;
Xd = [- Xpd(end: -1:1) ; Xpd ];


X = [ Xn(1: end /2) ; Xd(1: end /2) ; Xpd ; Xpn ];

stevilo1 = a;
st = 0
razdalja = 1000;
for i = [1: length(X)];
    d = abs(stevilo1 - X(i));
    if d < razdalja
        razdalja = d;
        st = X(i)
    end
end
nablizje_stevilo = st;

stevilo = -a; 
stevec1 = 0;
for i = (1: length(X));
    if X(i) > stevilo
        stevec1 = stevec1 +1;
    end
end


B = load('trznakapitalizacija.csv')

C = sum(B,2);
I = [1000; zeros(99,1)]; 
Ifloor = I; 
for d = 2:100; 
    r = C(d) / C(d-1); 
    I(d) = I(d-1)*r 
    Ifloor(d) = Ifloor(d-1)*floor(r*1000)/1000;
end
I(39)
Ifloor(39)

c = 216
f = @(x) c*(1+x)^4 + c*(1+x)^3 + c*(1+x)^2 + c*(1+x) - 1000
df = @(x) c*(10 + 20*x + 15*x^2 + 4*x^3)

odg_1 = bisekcija(f, 0, 1, 10)
[odg_2, X, k] = tangentna(f, df, 0, 0, 2)
[odg_3, X2, k1] = sekantna(f, 0, 1, 10^(-3), 10)
fzero(f, 0)