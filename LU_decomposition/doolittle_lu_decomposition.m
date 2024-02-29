function [L, U] = doolittle_lu_decomposition(A)
    [m, n] = size(A);
    if m ~= n
        error('Input matrix must be square');
    end
    U = zeros(n);
    L = eye(n);
    
    for p = 1:n
        for j = p:n
            sum = 0;
            for k = 1:p-1
                sum = sum + L(p,k) * U(k,j);
            end
            U(p,j) = A(p,j) - sum;
        end
        
        for i = p+1:n
            sum = 0;
            for k = 1:p-1
                sum = sum + L(i,k) * U(k,p);
            end
            L(i,p) = (A(i,p) - sum) / U(p,p);
        end
    end
end