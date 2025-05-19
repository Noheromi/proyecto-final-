% Método de Birge-Vieta en MATLAB
coef = [1, -5, 5, -1]; % Coeficientes del polinomio
x0 = 0.8;

for i = 1:3
    b = zeros(size(coef));
    c = zeros(size(coef));
    b(1) = coef(1);
    c(1) = b(1);
    
    for j = 2:length(coef)
        b(j) = coef(j) + x0 * b(j-1);
        if j > 2
            c(j) = b(j) + x0 * c(j-1);
        else
            c(j) = b(j);
        end
    end
    
    % Calcula la nueva aproximación de la raíz
    x1 = x0 - b(end)/c(end-1);
    
    % Imprime resultados de la iteración
    fprintf('Iteración %d: x=%.4f, f(x)=%.4f\n', i, x0, b(end));
    
    % Actualiza x0
    x0 = x1;
end
