function W = trabajoCargas(q1, q2, q3, a)
    % trabajoCargas - Calcula el trabajo necesario para armar tres cargas
    % en los vértices de un triángulo equilátero de lado a.
    %
    % Entradas:
    %   q1, q2, q3 - cargas (Coulomb)
    %   a - longitud del lado del triángulo (metros)
    %
    % Salida:
    %   W - trabajo (Joules)

    % Constante de Coulomb
    k = 9e9; 

    % Fórmula del trabajo en triángulo equilátero
    W = k * (q1*q2 + q1*q3 + q2*q3) / a;
end