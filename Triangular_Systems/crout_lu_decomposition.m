function [L, U] = crout_lu_decomposition(A)
    [m, n] = size(A);
    if m ~= n
        error('Input matrix must be square');
    end
    L = zeros(n);
    U = eye(n);
    
    for p = 1:n
        for i = p:n
            sum = 0;
            for k = 1:p-1
                sum = sum + L(i,k) * U(k,p);
            end
            L(i,p) = A(i,p) - sum;
        end
        
        for j = p+1:n
            sum = 0;
            for k = 1:p-1
                sum = sum + L(p,k)*U(k,j);
            end
            U(p,j) = (A(p,j) - sum) / L(p,p);
        end
    end
end