function W = trabajoCargas(q1, q2, q3, a)
    % trabajoCargas - Calcula el trabajo necesario para armar tres cargas
    % en los vértices de un triángulo equilátero de lado a.
    %
    % Variables de entrada:
    %   q1, q2, q3 - cargas (Coulomb).
    %   a - longitud del lado del triángulo (metros).
    %
    % Variables de salida:
    %   W - trabajo (Joules), distancia de a 
    %   Gráfico del trabajo en función de la distancia a y el valor de las cargas.



    % Constante de Coulomb
    k = 9e9; 

    % Fórmula del trabajo en un triángulo equilátero.
    W = k * (q1*q2 + q1*q3 + q2*q3) / a;
end