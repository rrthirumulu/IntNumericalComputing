function integral = composite_trap(a,b,h,f)
% Computer code for approximating the integral of a function using CTR
% Input:  a        --- lower bounds for the integral
%         b        --- upper bounds for the integral 
%         h        --- width of subintervals
%         f        --- the desired function
% Output: integral --- approximation of integral
% Author: Raghav Thirumulu, Perm 3499720
% Date:   08/21/2018

result=0; 
% Calculate the x values we want to use
x=[a+h:h:b-h];

% Calculate number of intervals for iteration
n=(b-a)/h;

% Iterate through the 
for i=1:n-1
    result=result+f(x(i));
end

% Edit values so they are representative of CTR
result=h*(result+0.5*(f(a)+f(b)));
integral=result;
end
