clc;
clear;

% Definir matriz y vector
A = [1, 2, 1;
     3, 8, 1;
     0, 4, 1];
b = [2; 12; 2];

fprintf("Matriz de coeficientes:\n");
disp(A);

fprintf("\nVector de terminos independientes:\n");
disp(b);

%% Solución por Gauss-Jordan (usando operador \)
C = A \ b;
fprintf("\nSolución por Gauss-Jordan:\n");
disp(C);

%% Error relativo porcentual (opcional)
er = @(vr, vn) abs((vr - vn) ./ vr) * 100;

%% Solución por matriz inversa
AI = inv(A);
fprintf("\nMatriz Inversa:\n");
disp(AI);

D = AI * b;
fprintf("\nSolución por Matriz Inversa:\n");
disp(D);

%% Solución por determinantes (Regla de Cramer)
DetA = det(A);
Detx = det([b, A(:,2:3)]);
Dety = det([A(:,1), b, A(:,3)]);
Detz = det([A(:,1:2), b]);

x = Detx / DetA;
y = Dety / DetA;
z = Detz / DetA;

fprintf("\nSolución por determinantes:\n");
fprintf("x = %.4f, y = %.4f, z = %.4f\n", x, y, z);

%% Descomposición LU manual
fprintf("\nDescomposición LU (manual):\n");

L = eye(3);   % matriz identidad 3x3
U = zeros(3); % matriz U vacía

% Fila 1 de U es igual a fila 1 de A
U(1,:) = A(1,:);

% Calcular L y U
L(2,1) = A(2,1)/U(1,1);
U(2,2) = A(2,2) - L(2,1)*U(1,2);
U(2,3) = A(2,3) - L(2,1)*U(1,3);

L(3,1) = A(3,1)/U(1,1);
L(3,2) = (A(3,2) - L(3,1)*U(1,2)) / U(2,2);
U(3,3) = A(3,3) - L(3,1)*U(1,3) - L(3,2)*U(2,3);

fprintf("Matriz L:\n");
disp(L);
fprintf("Matriz U:\n");
disp(U);
