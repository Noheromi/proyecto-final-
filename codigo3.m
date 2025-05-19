clc;
clear;

% Matriz de coeficientes y vector de términos independientes
A = [1, 1, 1;
     1, 2, 5;
     1, 4, 25];
b = [6; 12; 36];

fprintf('Matriz de coeficientes:\n');
disp(A);
fprintf('Vector de términos independientes:\n');
disp(b);

%% Solución por Gauss-Jordan (A \ b)
C = A \ b;
fprintf('\nSolución por Gauss-Jordan:\n');
disp(C);

%% Solución usando la matriz inversa
AI = inv(A);
fprintf('\nMatriz inversa de A:\n');
disp(AI);

D = AI * b;
fprintf('\nSolución usando la matriz inversa:\n');
disp(D);

%% Solución por determinantes (Regla de Cramer)
DetA = det(A);
Detx = det([b, A(:,2), A(:,3)]);
Dety = det([A(:,1), b, A(:,3)]);
Detz = det([A(:,1), A(:,2), b]);

x = Detx / DetA;
y = Dety / DetA;
z = Detz / DetA;

fprintf('\nSolución por determinantes (Cramer):\n');
fprintf('x = %.4f, y = %.4f, z = %.4f\n', x, y, z);

%% Descomposición LU (manual)
fprintf('\nDescomposición LU (manual):\n');

L = eye(3);        % Matriz identidad
U = zeros(3);      % Inicialización de U

U(1,:) = A(1,:);
L(2,1) = A(2,1) / U(1,1);
U(2,2) = A(2,2) - L(2,1)*U(1,2);
U(2,3) = A(2,3) - L(2,1)*U(1,3);

L(3,1) = A(3,1) / U(1,1);
L(3,2) = (A(3,2) - L(3,1)*U(1,2)) / U(2,2);
U(3,3) = A(3,3) - L(3,1)*U(1,3) - L(3,2)*U(2,3);

fprintf('Matriz L:\n');
disp(L);
fprintf('Matriz U:\n');
disp(U);

%% Descomposición de Cholesky (solo válida
