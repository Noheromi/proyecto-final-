clc;
clear;

% Matriz de coeficientes y vector b
A = [4, -2, 1;
    -2, 4, -2;
     1, -2, 4];
b = [11; -16; 17];

fprintf('Matriz de coeficientes A:\n');
disp(A);
fprintf('Vector de términos independientes b:\n');
disp(b);

%% Solución por Gauss-Jordan (A \ b)
C = A \ b;
fprintf('\nSolución por Gauss-Jordan:\n');
disp(C);

%% Solución por matriz inversa
AI = inv(A);
fprintf('\nMatriz Inversa de A:\n');
disp(AI);

D = AI * b;
fprintf('\nSolución por Matriz Inversa:\n');
disp(D);

%% Solución por determinantes (Cramer)
DetA = det(A);
Detx = det([b, A(:,2:3)]);
Dety = det([A(:,1), b, A(:,3)]);
Detz = det([A(:,1:2), b]);

x = Detx / DetA;
y = Dety / DetA;
z = Detz / DetA;

fprintf('\nSolución por determinantes (Cramer):\n');
fprintf('x = %.4f, y = %.4f, z = %.4f\n', x, y, z);

%% Descomposición LU (manual)
fprintf('\nDescomposición LU (manual):\n');

L = eye(3);
U = zeros(3);

U(1,:) = A(1,:);
L(2,1) = A(2,1)/U(1,1);
U(2,2) = A(2,2) - L(2,1)*U(1,2);
U(2,3) = A(2,3) - L(2,1)*U(1,3);

L(3,1) = A(3,1)/U(1,1);
L(3,2) = (A(3,2) - L(3,1)*U(1,2))/U(2,2);
U(3,3) = A(3,3) - L(3,1)*U(1,3) - L(3,2)*U(2,3);

fprintf('Matriz L:\n');
disp(L);
fprintf('Matriz U:\n');
disp(U);

%% Descomposición de Cholesky
fprintf('\nDescomposición de Cholesky:\n');

CH = zeros(3);
CH(1,1) = sqrt(A(1,1));
CH(2,1) = A(2,1)/CH(1,1);
CH(3,1) = A(3,1)/CH(1,1);
CH(2,2) = sqrt(A(2,2) - CH(2,1)^2);
CH(3,2) = (A(3,2) - CH(3,1)*CH(2,1)) / CH(2,2);
CH(3,3) = sqrt(A(3,3) - CH(3,1)^2 - CH(3,2)^2);

fprintf('Matriz L (Cholesky):\n');
disp(CH);

fprintf('\nMatriz L transpuesta (L^T):\n');
disp(CH');
