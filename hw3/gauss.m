function [x,L,U] = gauss(A,b)
% Computer code for solving a linear system using Gaussian elimination
% and partial pivoting (interchanging rows)
% Input:  A  --- nxn matrix of coefficients
%         b  --- n-vector
% Output  x  --- solution vector to the system
%         L  --- lower triangular matrix from LU factorization
%         U  --- upper triangular matrix from LU factorization
% Author: Raghav Thirumulu, Perm 3499720
% Date:   08/29/2018

% Find LU factorization of A, then use back-substitution for efficiency
[L,U,P] = lu_factorization(A);
try
    x = U\(L\(P*b));
catch
    disp('A is singular, no solution')
end

    function [L,U,P] = lu_factorization(A)
    % Nested function to calculate LU factorization of matrix A using
    % partial pivoting
    % Input:  A  --- nxn matrix of coefficients
    % Output: L  --- lower triangular matrix from LU factorization
    %         U  --- upper triangular matrix from LU factorization
    %         P  --- permutation matrix such that PA = LU     
    % Set up vector sizes
    n = size(A,1); 
    I = eye(n); 
    O = zeros(n); 
    L = I; 
    U = O; 
    P = I;
    % For loop for finding new pivot, uses switch_rows to switch rows if 
    % necessary
    for k = 1:n
        if k == 1 
            v(k:n) = A(k:n,k);
        else
            z = L(1:k-1,1:k -1)\ A(1:k-1,k);
            U(1:k-1,k) = z;
            v(k:n) = A(k:n,k)-L(k:n,1:k-1)*z;
        end
        if k<n
            x = v(k:n); p = (k-1)+find(abs(x) == max(abs(x)));
            switch_rows(k,p);
            L(k+1:n,k) = v(k+1:n)/v(k);
            if k > 1, adjust_L(k,p); end
        end
        U(k,k) = v(k);
    end
            function switch_rows(k,p)
            % Nested function to place element (p,k) in the (k,k) position
            % Input:  rows k and p
            % Output: No output, adjusts matrix in outer function
                x = P(k,:); P(k,:) = P(p,:); P(p,:) = x;
                x = A(k,:); A(k,:) = A(p,:); A(p,:) = x;
                x = v(k); v(k) = v(p); v(p) = x;
            end
        
            function adjust_L(k,p)
            % Nested function to adjust the lower triangular matrix once 
            % rows have been switched
            % Input:  rows k and p
            % Output: No output, adjusts matrix in outer function
                x = L(k,1:k-1); L(k,1:k-1) = L(p,1:k-1);
                L(p,1:k-1) = x;
            end
    end % End of lu_factorization
end % End of gauss.m
