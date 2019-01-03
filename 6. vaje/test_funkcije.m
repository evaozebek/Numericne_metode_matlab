function [a] = test_funkcije(stopnja, matrika_tock)
%stopnja_aproksimacije = stopnja polinoma ki ga zelis za aprokismacijo
%matrika_tock = stevilo tock ki jih imas podanih za ta problem
stopnja_aproksimacije = stopnja + 1;
A = ones(length(matrika_tock), stopnja_aproksimacije);
for i = 1:length(matrika_tock)
    for j = 1:stopnja_aproksimacije  
        A(i,(stopnja_aproksimacije + 1 - j)) = (matrika_tock(i,1))^(j -1);
    end
end

b = matrika_tock(:,2);
a = A\b;

plot(matrika_tock(:,1), polyval(a, matrika_tock(:,1)))
end

