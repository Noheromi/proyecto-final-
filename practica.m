
% Practica 1 
% Noheromi Guadalupe Hernandez Avalos

% Definir el valor de N
N = 99;  % Puedes cambiar este valor para probar

% Verificar si N es un entero positivo
if N ~= fix(N)  % Para el redonde de un numero 
    disp('Error: N no es un número entero.');
elseif N <= 0
    disp('Error: N no es un número positivo.');
else
    disp('N es un número entero positivo.');
    
    % Generar un vector de N elementos con valores aleatorios entre 1 y 9
    X = randi([1, 9], 1, N); 
    
    % Mostrar el vector generado
    fprintf('Vector generado: ');
    disp(X);
end