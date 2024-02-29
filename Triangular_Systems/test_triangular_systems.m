clear; clc; format short;

% A generic linear system of equations can be solved by solving two
% triangular systems: a lower and an upper one, respectively:
% Ax = b, but A = L * U, so LUx = b
% Let y = Ux, so system becomes Ly = b
% Solve lower triangular system to find y, then solve lower triangular
% Ux = y to find the solution to the original system.
%
%
% Why solve like this? Lower and upper systems are trivial to solve with forward
% and backward substitution, respectively.
%
% This method is ideal for real matrices less than 16x16

% 2x + 3y - z = 1
% 4x + 2y + 3z = -2
% x - y + 2z = 3
A = [2, 3, -1; 
     4, 2, 3; 
     1, -1, 2];
b = [1; -2; 3];

[L, U] = crout_lu_decomposition(A)    
% Solve Ly = b for y using forward substitution
y = forward_substitution(L, b)
% Solve Ux = y for x using backward substitution
x = backward_substitution(U, y)