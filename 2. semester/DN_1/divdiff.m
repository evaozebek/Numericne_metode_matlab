function [TDD, koef] = divdiff(X, F)
%X... vektor interpolacijskih toèk
%F... anonimna funkcija, ki jo želimo interpolirati
%
% Opomba: Funkcija je bila spremenjena, da sprejme anonimno funkcijo ki jo
% želimo interpolirati in sama ustvari vektor vrednosti Y in vrne tako
% matriko s postopkom in vektor koeficientov. 
% 
%
% DIVDIFF
%   Newton's Method for Divided Differences.
%
%   The following formula is solved:
%       Pn(x) = f(x0) + f[x0,x1](x-x0) + f[x0,x1,x2](x-x0)(x-x1) + ...
%           + f[x0,x1,..,xn](x-x0)(x-x1)..(x-x[n-1])
%       where f[x0,x1] = (f(x1-f(x0))/(x1-x0)
%             f[x0,x1,..,xn] = (f[x1,..,xn]-f[x0,..,x_[n-1]])/(xn-x0)
%
% Example:
%   [d, koef] = divdiff([0 0.2 0.4 0.6 0.8 1], @(x) (cos(2 + 2*x)).^2)
%
% Author:	Tashi Ravach
% Version:	1.0
% Date:     22/05/2006

X = X';
Y = zeros(1,length(X));
for i = 1:length(X)
    Y(1,i) = F(X(1,i));
end
    if nargin ~= 2
        error('divdiff: invalid input parameters'); 
    end
    [ p, m ] = size(X); % m points, polynomial order <= m-1
    if p ~= 1 || p ~=size(Y, 1) || m ~= size(Y, 2)
        error('divdiff: input vectors must have the same dimension'); 
    end
    TDD = zeros(m, m);
    TDD(:, 1) = Y';
    for j = 2 : m
        for i = 1 : (m - j + 1)
            TDD(i,j) = (TDD(i + 1, j - 1) - TDD(i, j - 1)) / (X(i + j - 1) - X(i));
        end
    end

koef = TDD(1,:)';
end