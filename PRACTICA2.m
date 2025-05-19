% Practica 1 
% Noheromi Guadalupe Hernandez Avalos
N = 5; 
X = randi([1, 9], 1, N); % Genera un vector de N elementos con valores entre 1 y 9
fprintf('Vector: ');
disp(X);

% Construcción de la primera matriz
matriz1 = zeros(N); % Inicializa una matriz de ceros de NxN
for i = 1:N
    for j = 1:N
        matriz1(i, j) = X(i) * j; % Multiplica cada elemento del vector por la columna
    end
end
disp('Matriz 1:');
disp(matriz1);

% Construcción de la segunda matriz
matriz2 = zeros(N); % Inicializa otra matriz de ceros de NxN
for i = 1:N
    for j = 1:N
        matriz2(i, j) = X(j) * i; % Multiplica cada elemento del vector por la fila
    end
end
disp('Matriz 2:');
disp(matriz2);