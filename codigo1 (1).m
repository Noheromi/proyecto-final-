% Método de la falsa posición en MATLAB
f = @(x) 2*x*cos(2*x) - (x + 1)^2;

a = -3; b = -2;
for i = 1:3
    fa = f(a);
    fb = f(b);
    xi = (a * fb - b * fa) / (fb - fa);
    fxi = f(xi);
    
    % Imprime resultados de la iteración
    fprintf('Iteración %d: a=%.4f, b=%.4f, xi=%.4f, f(xi)=%.4f\n', i, a, b, xi, fxi);
    
    % Determina nuevo intervalo
    if fa * fxi < 0
        b = xi;
    else
        a = xi;
    end
    
    % Calcula el error relativo
    er = abs((b - a) / xi) * 100;
    fprintf('Error relativo: %.4f%%\n', er);
end
