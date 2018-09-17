function x = tridiagonal(d,e,f,b)
% Computer code for solving the nxn tridiagonal system for x
% Input:  d  --- vector of coefficients on the main diagonal of A
%         e  --- vector of coefficients on the lower diagonal of A
%         f  --- vector of coefficients on the upper diagonal of A
%         b  --- the vector in the solution Ax=b
% Output  x  --- solution vector to the system Ax=b
% Author: Raghav Thirumulu, Perm 3499720
% Date:   09/06/2018

% Set up appropriate vector lengths
n = length(b);
temp = zeros(n,1);   
x = zeros(n,1);
temp2 = d(1);
x(1) = b(1)/temp2;

% Begin decomposition and forward substitution\
for i=2:n
    temp(i-1) = f(i-1)/temp2;
    temp2 = d(i)-e(i)*temp(i-1);
    x(i) = (b(i)-e(i)*x(i-1))/temp2;
end

% Perform the back-substiution
for j=n-1:-1:1
   x(j) = x(j)-temp(j)*x(j+1);
end

end