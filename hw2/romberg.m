function [R,error,levels]=romberg(f,a,b,tol)
% Computer code for utilizing the Romberg algorithm to determine
% number of levels needed to achieve a certain error threshold
% Input:  f        --- the desired function
%         a        --- lower bounds of integral
%         b        --- upper bounds of integral
%         tol      --- desired user tolerance
% Output: R        --- approximation of integral
%         error    --- the approximate error we achieve
%         levels   --- # of levels needed for error to be less than tol
% Author: Raghav Thirumulu, Perm 3499720
% Date:   08/21/2018

% Set a really high default max iterations value
max_iterations=100;

% Use only one sub-interval to begin
n = 1;

% Use our CTR formula from question 1, set default levels to 0
I(1,1) = composite_trap(a,b,(b-a)/n,f);
levels = 0;

% Romberg algorithm, increase our levels till our error term goes
% under the value of the tolerance
while levels<max_iterations
    levels = levels+1;
    
    % Calculate number of subintervals depending on levels
    n = 2^levels;
    % Compute CTR for the correct level
    I(levels+1,1) = composite_trap(a,b,(b-a)/n,f);
    for k = 2:levels+1
        j = 2+levels-k;
        I(j,k) = (4^(k-1)*I(j+1,k-1)-I(j,k-1))/(4^(k-1)-1);
    end
    error = abs((I(1,levels+1)-I(2,levels))/I(1,levels+1))*100;
    if error<=tol, break; end
end

R = I(1,levels+1);