function resultados = campoElectrico(a_values, q1_value, q2_value, q3_value, posicion_p)
    % ----- Parámetros del sistema -----
    ke = 9e9;  % Constante de Coulomb [N·m^2/C^2]
    
    % Prealocar resultados
    resultados = zeros(length(a_values), 1);
    
    for i = 1:length(a_values)
        a = a_values(i);  % Lado del triángulo equilátero en metros
        q1 = double(q1_value) * 1e-6;  % Carga 1 en Coulombs
        q2 = double(q2_value) * 1e-6;  % Carga 2 en Coulombs
        q3 = double(q3_value) * 1e-6;  % Carga 3 en Coulombs
        y = double(posicion_p);         % Posición de P
        
        % ----- Altura del triángulo equilátero -----
        h = (sqrt(3) / 2) * a;
        
        % ----- Distancias desde P a cada carga -----
        r1 = sqrt((a / 2)^2 + y^2);     % Distancia de P a q1
        r2 = sqrt((a / 2)^2 + y^2);     % Distancia de P a q2
        r3 = abs(y - h);                 % Distancia de P a q3 (vertical)
        
        % ----- Ángulos para q1 y q2 respecto a la vertical -----
        cos_angulo = y / r1;            % Componente coseno del ángulo
        sen_angulo = (a / 2) / r1;       % Componente seno del ángulo
        
        % ----- Cálculo de campos eléctricos (con signo) -----
        E1_mag = ke * q1 / r1^2;         % Campo eléctrico de q1 (con signo)
        E2_mag = ke * q2 / r2^2;         % Campo eléctrico de q2 (con signo)
        E3_mag = ke * q3 / r3^2;         % Campo eléctrico de q3 (con signo)
        
        % ----- Componentes del campo eléctrico de q1 y q2 -----
        % Componente x de los campos eléctricos
        Ex_q1 = E1_mag * sen_angulo;     % Campo x de q1: positiva
        Ex_q2 = -E2_mag * sen_angulo;    % Campo x de q2: negativa
        Ex_q3 = 0;                        % q3 está sobre el eje y
        
        % Componente y de los campos eléctricos
        Ey_q1 = E1_mag * cos_angulo;     % Campo y de q1: positiva
        Ey_q2 = E2_mag * cos_angulo;     % Campo y de q2: positiva
        Ey_q3 = E3_mag;                  % Campo y de q3: ya tiene signo negativo
        
        % ----- Componentes totales del campo eléctrico -----
        Ex_total = Ex_q1 + Ex_q2 + Ex_q3; % Componente x total
        Ey_total = Ey_q1 + Ey_q2 + Ey_q3; % Componente y total
        
        % ----- Magnitud total del campo eléctrico en P -----
        E_total = sqrt(Ex_total.^2 + Ey_total.^2);
        
        % Guardar resultado
        resultados(i) = E_total;  % Almacena el resultado para cada valor de a
    end
end