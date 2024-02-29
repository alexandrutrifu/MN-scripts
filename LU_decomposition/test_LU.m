clear; clc; format short;

A = [25, 15, -5; 15, 18, 0; -5, 0, 11];
disp("Original matrix:");
disp(A);

% Test Crout LU decomposition
[L, U] = crout_lu_decomposition(A);
disp("\nCrout LU decomposition:");
disp("L = ");
disp(L);
disp("U = ");
disp(U);
assert(all(all(abs((L*U) - A) <= 1e-5)), 'L*U != A');

% Test Doolittle LU decomposition
[L, U] = doolittle_lu_decomposition(A);
disp("\nDoolittle LU decomposition:");
disp("L = ");
disp(L);
disp("U = ");
disp(U);
assert(all(all(abs((L*U) - A) <= 1e-5)), 'L*U != A');

% Test Cholesky decomposition
L = cholesky_decomposition(A);
disp("\nCholesky decomposition:");
disp("L = ");
disp(L);