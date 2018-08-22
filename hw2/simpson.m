function integral = simpson(a,b,h,f)
% Computer code for approximating the integral of a function using Simpson
% Input:  a        --- lower bounds for the integral
%         b        --- upper bounds for the integral 
%         h        --- width of subintervals
% Output: integral --- approximation of integral
% Author: Raghav Thirumulu, Perm 3499720
% Date:   08/21/2018

result=0; 

% Calculate the x values we want to use
x=[a:h:b];

% Edit values so they are representative of Simpson's
result=h/3*(f(x(1))+2*sum(f(x(3:2:end-2)))+4*sum(f(x(2:2:end)))+f(x(end)));
integral=result;

end
