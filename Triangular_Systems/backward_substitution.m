function x = backward_substitution(U, b)
    n = length(b);
    x = zeros(n, 1);
    
    for i = n:-1:1
        sum = 0;
        for j = i+1:n
            sum = sum + U(i,j)*x(j);
        end
        x(i) = (b(i) - sum) / U(i,i);
    end
end