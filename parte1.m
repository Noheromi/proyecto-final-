clc; clear; close all;

f = @(x) 2*x.*cos(2*x) - (x+1).^2;
a = -3;
b = -2;
xr_real = -2.1913;
N = 5;

fprintf('Iteración    x_i        a        b        Error relativo (%%)\n');
fprintf('------------------------------------------------------------\n');

for i = 1:N
    xi = (a + b) / 2;
    fa = f(a);
    fx = f(xi);
    
    if i == 1
        er = NaN;
    else
        er = abs((xi - xr_real) / xr_real) * 100;
    end
    
    fprintf('%4d    %8.4f   %8.4f   %8.4f   %8.4f\n', i, xi, a, b, er);
    
    if fa * fx < 0
        b = xi;
    else
        a = xi;
    end
end

x_vals = linspace(-3, -2, 100);
y_vals = f(x_vals);

figure;
plot(x_vals, y_vals, 'b', 'LineWidth', 2);
hold on;
plot(xi, f(xi), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
yline(0, '--k');
xlabel('x');
ylabel('f(x)');
title('Método de Bisección');
grid on;
legend('f(x)', 'Raíz estimada');
hold off;