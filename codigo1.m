A = [1, -0.1, -0.2; 0.1, 7, -0.3; 0.3, -0.2, -10];
b = [7.85; 19.3; 71.4];

% Función de error relativo porcentual
er = @(vr, vn) abs((vr - vn) ./ vr) * 100;

fprintf('\nIteraciones por metodo de Jacobi\n');
x1_v = 0; x2_v = 0; x3_v = 0;
n_iter = 5;

for k = 1:n_iter
    x1 = (-A(1,2) * x2_v - A(1,3) * x3_v + b(1)) / A(1,1);
    x2 = (-A(2,1) * x1_v - A(2,3) * x3_v + b(2)) / A(2,2);
    x3 = (-A(3,1) * x1_v - A(3,2) * x2_v + b(3)) / A(3,3);

    fprintf('i=%d x1=%.4f x2=%.4f x3=%.4f\n', k, x1, x2, x3);
    fprintf('error x1=%.4f, error x2=%.4f, error x3=%.4f\n', ...
        er(x1, x1_v), er(x2, x2_v), er(x3, x3_v));

    x1_v = x1; x2_v = x2; x3_v = x3;
end

fprintf('\nIteraciones por metodo de Gauss-Seidel\n');
x1_v = b(1) / A(1,1);
x2_v = 0; x3_v = 0;
n_iter = 5;

for k = 1:n_iter
    x1 = (b(1) - A(1,2)*x2_v - A(1,3)*x3_v) / A(1,1);
    x2 = (b(2) - A(2,1)*x1 - A(2,3)*x3_v) / A(2,2);
    x3 = (b(3) - A(3,1)*x1 - A(3,2)*x2) / A(3,3);

    fprintf('i=%d x1=%.4f x2=%.4f x3=%.4f\n', k, x1, x2, x3);
    fprintf('error x1=%.4f, error x2=%.4f, error x3=%.4f\n', ...
        er(x1, x1_v), er(x2, x2_v), er(x3, x3_v));

    x1_v = x1; x2_v = x2; x3_v = x3;
end
