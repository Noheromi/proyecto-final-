clc; clear; close all;

f = @(x) 8*x.*sin(x).*exp(-x) - 1;
df = @(x) 8*exp(-x).*(sin(x) + x.*cos(x)) - 8*x.*sin(x).*exp(-x); 

x0 = 0.3;
N = 5;

fprintf('Iteración    x_i        f(x_i)     f''(x_i)    Error relativo (%%)\n');
fprintf('-------------------------------------------------------------------\n');

for i = 1:N
    fx = f(x0);
    dfx = df(x0);
    
    if dfx == 0
        error('Derivada nula, Newton-Raphson no puede continuar.');
    end
    
    x1 = x0 - fx / dfx;
    
    if i == 1
        er = NaN;
    else
        er = abs((x1 - x0) / x1) * 100;
    end
    
    fprintf('%4d    %8.4g   %8.4g   %8.4g   %8.4g\n', i, x1, fx, dfx, er);
    
    x0 = x1;
end

x_vals = linspace(0, 1, 100);
y_vals = f(x_vals);

figure;
plot(x_vals, y_vals, 'b', 'LineWidth', 2);
hold on;
plot(x1, f(x1), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
yline(0, '--k');
xlabel('x');
ylabel('f(x)');
title('Método de Newton-Raphson');
grid on;
legend('f(x)', 'Raíz estimada');
hold off;