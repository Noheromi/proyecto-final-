% Practica 1 
% Noheromi Guadalupe Hernandez Avalos
% Gráfica de tres funciones: y = x, y = x^2, y = x^3

% Definir el rango de x
x = linspace(-2, 2, 100);

% Definir las funciones
y1 = x+1;
y2 = x.^5; % Elemento a elemento
y3 = x.^3; % Elemento a elemento

% Crear la figura
figure;
hold on;
grid on;

% Graficar las funciones con estilos específicos
plot(x, y1, 'B--', 'LineWidth', 1.5, 'DisplayName', 'y = x');  
plot(x, y2, 'P-.', 'LineWidth', 1.5, 'DisplayName', 'y = x^2'); 
plot(x, y3, 'r:', 'LineWidth', 1.5, 'DisplayName', 'y = x^3');  

% Personalizar la gráfica
title('Gráfica de tres funciones');
xlabel('x');
ylabel('y');
legend('Location', 'best');
hold off;