
clc; clear; close all;

f = @(x) 8*x.*sin(x).*exp(-x) - 1;
x0 = 0.3;
x1 = 0.5;
tol = 1e-4;
max_iter = 5;

X = [x0, x1];
fprintf('Iteración\t x_i\t\t f(x_i)\t\t Error Relativo (%%)\n');

for i = 1:max_iter
    f0 = f(X(end-1));
    f1 = f(X(end));
    x_new = X(end) - f1 * (X(end) - X(end-1)) / (f1 - f0);
    error_rel = abs((x_new - X(end)) / x_new) * 100;
    fprintf('%d\t\t %.4f\t %.4f\t %.4f\n', i, X(end), f1, error_rel);
    X = [X, x_new];
    if error_rel < tol
        break;
    end
end

x_vals = linspace(0, 1, 100);
y_vals = f(x_vals);

figure;
plot(x_vals, y_vals, 'b', 'LineWidth', 1.5);

hold on;
plot(X(end), f(X(end)), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
yline(0, '--k');
xlabel('x');
ylabel('f(x)');
title('Método de la Secante');
grid on;
legend('f(x)', 'Raíz aproximada');