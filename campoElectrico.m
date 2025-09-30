
function Emagnitud = campoElectrico(a, h, q1, q2, q3, k, coordY)
  
   % campoElectrico - ¿Cuál es la magnitud del campo eléctrico en un 
   % punto P que se mueve a lo largo de la altura (h) del triángulo 
   % equilátero si el lado del triángulo es a = 10 cm?

   % Variables de entrada 
   %   valores de las cargas (q1, q2 y q3) 
   %   5 coordenadas diferentes del punto p (esta coordenada tiene una x 
   %   fija (a /2) y una y variable, entre 0 y h.

   % Variables de salida 
   %   |E| en el punto p para cada coordenada.
   %   Gráfico del E en función del valor de la coordenada y del punto p.
   
     % Inicializar vector de resultados
    Emagnitud = zeros(size(coordY));

    % Cálculo de |E| para cada coordenada Y
    for i = 1:length(coordY)
        y = coordY(i);
        Px = a/2; 
        Py = y;

        % Distancias desde P a cada carga
        r1 = sqrt((Px-0)^2 + (Py-0)^2);        
        r2 = sqrt((Px-a)^2 + (Py-0)^2);        
        r3 = sqrt((Px-a/2)^2 + (Py-h)^2);      

        % Vectores unitarios
        u1 = [(Px-0) (Py-0)]/r1;
        u2 = [(Px-a) (Py-0)]/r2;
        u3 = [(Px-a/2) (Py-h)]/r3; 

        % Campos individuales
        E1 = k*q1/r1^2 * u1;
        E2 = k*q2/r2^2 * u2;
        E3 = k*q3/r3^2 * u3;

        % Campo total (vector)
        Evector = E1 + E2 + E3;

        % Magnitud del campo
        Emagnitud(i) = norm(Evector);
    end
end

