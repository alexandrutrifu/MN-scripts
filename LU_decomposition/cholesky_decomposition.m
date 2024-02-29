function L = cholesky_decomposition(A)
    [m, n] = size(A);
    if m ~= n
        error('Input matrix must be square');
    end
    
    % Check symmetry
    if ~isequal(A, A')
        error('Input matrix must be symmetric');
    end
    
    % Check positive definiteness
    if any(eig(A) <= 0)
        error('Input matrix must be positive definite');
    end
    
    L = zeros(n);
    
    for i = 1:n
        for j = 1:i
            sum = 0;
            for k = 1:j-1
                sum = sum + L(i,k)*L(j,k);
            end
            if i == j
                L(i,j) = sqrt(A(i,i) - sum);
            else
                L(i,j) = (A(i,j) - sum) / L(j,j);
            end
        end
    end
end