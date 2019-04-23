A = 2*eye(100,100);
for i = 1:99
    A(i,i+1)= -1;
    A(i+1,i)= -1;
end
z = zeros(100,1);
z(1,1)= 1;
[z0] = inverzna_iteracija(A,z, 10^5, 0, 10^-10);
[z1] = inverzna_iteracija(A,z, 10^5, 1, 10^-10);
[z3] = inverzna_iteracija(A,z, 10^5, 3, 10^-10);
[z4] = inverzna_iteracija(A,z, 10^5, 4, 10^-10);

e0 = round(z0'*A*z0,10);
e1 = round(z1'*A*z1,10);
e3 = round(z3'*A*z3,10);
e4 = round(z4'*A*z4,10);


