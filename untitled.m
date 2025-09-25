% ----- Variables de entrada (pedidas al usuario) -----
q1 = input('Ingrese la carga q1 (C): ');
q2 = input('Ingrese la carga q2 (C): ');
q3 = input('Ingrese la carga q3 (C): ');
a  = input('Ingrese el lado del triangulo a (m): ');

ke = 9e9;  % Constante de Coulomb [N·m^2/C^2]

% Altura del triangulo equilatero
h = (sqrt(3)/2)*a;
fprintf('La altura del triangulo es h = %.4f m\n',h);

% Usuario ingresa 5 coordenadas y
y_vals = zeros(1,5);
for i = 1:5
    y_vals(i) = input(sprintf('Ingrese la coordenada y%d (entre 0 y %.4f m): ',i,h));
end

% Prealocar vector de resultados
E_vals = zeros(size(y_vals));

% ----- Cálculo de |E| para cada punto -----
for i = 1:length(y_vals)
    y = y_vals(i);
    Px = a/2; 
    Py = y;
    
    % Distancias desde P a cada carga
    r1 = sqrt((Px-0)^2 + (Py-0)^2);   % P a q1
    r2 = sqrt((Px-a)^2 + (Py-0)^2);   % P a q2
    r3 = abs(Py-h);                   % P a q3 (vertical)
    
    % Vectores unitarios
    u1 = [(Px-0) (Py-0)]/r1;
    u2 = [(Px-a) (Py-0)]/r2;
    u3 = [0 (Py-h)]/r3;
    
    % Campos individuales
    E1 = ke*q1/r1^2 * u1;
    E2 = ke*q2/r2^2 * u2;
    E3 = ke*q3/r3^2 * u3;
    
    % Campo total
    Etot = E1 + E2 + E3;
    E_vals(i) = norm(Etot);
    
    % Mostrar resultado
    fprintf('Punto P = (%.3f , %.3f) m -> |E| = %.3e N/C\n',Px,Py,E_vals(i));
end

% ----- Gráfico -----
figure;
plot(y_vals,E_vals,'-o','LineWidth',2,'MarkerSize',6);
xlabel('Coordenada y [m]');
ylabel('|E| [N/C]');
title('Magnitud del campo eléctrico en el punto P a lo largo de la altura');
grid on;  
