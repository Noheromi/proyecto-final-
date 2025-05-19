
% Practica 1 
% Noheromi Guadalupe Hernandez Avalos% Generación de un vector aleatorio y matrices con múltiplos

% Definir el tamaño del vector y matrices
N =333;

% Generar y mostrar el vector aleatorio
vectorNumeros = generarVector(N);
fprintf('Vector generado:\n');
disp(vectorNumeros);

% Generar matrices
matrizMultiplicaFilas = matrizPorFilas(vectorNumeros);
matrizMultiplicaColumnas = matrizPorColumnas(vectorNumeros);

% Mostrar resultados
fprintf('Matriz con múltiplos en las filas:\n');
disp(matrizMultiplicaFilas);

fprintf('Matriz con múltiplos en las columnas:\n');
disp(matrizMultiplicaColumnas);

% Función para generar un vector aleatorio de N elementos
function vector = generarVector(tamano)
    vector = randi([1, 9], 1, tamano);
end

% Función para generar la matriz con múltiplos en las filas
function matriz = matrizPorFilas(datos)
    tam = length(datos);
    matriz = zeros(tam);
    for fila = 1:tam
        matriz(fila, :) = datos(fila) * (1:tam);
    end
end


% Función para generar la matriz con múltiplos en las columnas

function matriz = matrizPorColumnas(datos)
    tam = length(datos);
    matriz = zeros(tam);
    for col = 1:tam
        matriz(:, col) = datos(col) * (1:tam)';
    end
end