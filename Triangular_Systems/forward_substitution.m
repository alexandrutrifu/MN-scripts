function x = forward_substitution(L, b)
    n = length(b);
    x = zeros(n, 1);
    
    for i = 1:n
        sum = 0;
        for j = 1:i-1
            sum = sum + L(i,j)*x(j);
        end
        x(i) = (b(i) - sum) / L(i,i);
    end
end