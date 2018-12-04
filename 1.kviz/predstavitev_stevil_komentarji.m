% sistem
b = 5; t = 4; L = -5; U = 5;

% b = baza , t= dolzina mantise, L,U=meje eksponenta
%kodo rabim povecat za for zanko ce imam vecji t oz zmanjsati

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% mantise
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% normalizirana �tevila
d = U - L +1;
bm = b ^( t -1) ;
Xpn = zeros (( b -1) * bm , d ) ;
for i = 0: d -1
    Xpn (: , i +1) = M ( bm +1: end) * b ^( L + i ) ;
end
Xpn = Xpn (:) ;
Xn = [- Xpn( end : -1:1) ; Xpn ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% denormalizirana stevila
Xpd = M (2: b ^( t -1) ) * b ^ L;
Xd = [- Xpd(end: -1:1) ; Xpd ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% predstavljiva stevila ( brez 0 , Inf , -Inf in NaN)
X = [ Xn(1: end /2) ; Xd(1: end /2) ; Xpd ; Xpn ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%delez denormaliziranih stevil
delez_denormaliziranih = length(Xd) / length(X)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%delez normaliziranih stevil
delez_normaliziranih = length(Xn) / length(X)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%stevilo normaliziranih stevil, manjsih od (pi)

stevilo = input ('Vnesite stevilo : ') ; 
stevec1 = 0;
for i = (1: length(Xn));
    if Xn(i) < stevilo
        stevec1 = stevec1 +1;
    end
end
fprintf('Stevilo normaliziranih stevil, manjsih od %d je %d.\n',stevilo,stevec1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

razlika = input ('Vnesite manj od koliko naj se razlikujejo: ') ;
najvecje = [];
for i = (1 : length (X));
    if abs(X(i) - stevilo) < razlika;
        najvecje = [najvecje; X(i)];
    end
end

razmiki = [];
for i = [2: length(najvecje)];
    razmiki = [razmiki; (najvecje(i) - najvecje(i-1))];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

povprecni_razmiki = sum(razmiki) / length(razmiki)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

stevilo1 = 0;
razdalja = 1000;
for i = [1: length(X)];
    st = X(i);
    d = abs(stevilo - st);
    if d < razdalja
        razdalja = d;
        stevilo1 = st;
    end
end
nablizje_stevilo = stevilo1;
fprintf('Predstavljivo stevilo, ki najblizje stevilu %d je %d (oz FL(X)).\n',stevilo,nablizje_stevilo)

        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

najvecje = [];
for i = (1 : length (X));
    if X(i) < stevilo;
        najvecje = [najvecje; X(i)];
    end
end
najvecje_st = max(najvecje);
fprintf('Najvecje stevilo iz sistema, ki je manjse od %d je %d.\n',stevilo,najvecje_st)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

najmanjse = [];
for i = (1 : length (X));
    if X(i) > stevilo;
        najmanjse = [najmanjse; X(i)];
    end
end
najmanjse_st = min(najmanjse);
fprintf('Najmanjse stevilo iz sistema, ki je vecje od %d je %d.\n',stevilo,najmanjse_st)
