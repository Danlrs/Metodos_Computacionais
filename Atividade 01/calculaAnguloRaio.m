function resultado = calculaAnguloRaio(x, y)
    % Determina o número de elementos nos vetores x e y
    n = length(x);
    
    % Inicializa os vetores para armazenar o raio e o ângulo
    raio = zeros(n, 1);
    angulo = zeros(n, 1);
    
    % Loop para calcular o raio e o ângulo para cada par (x, y)
    for i = 1:n
        % Calcula o raio como a distância até a origem
        raio(i) = sqrt(x(i)^2 + y(i)^2);
        
        % Calcula o ângulo dependendo da posição no plano cartesiano
        if x(i) > 0
            angulo(i) = atan(y(i)/x(i));
        elseif x(i) < 0
            if y(i) > 0
                angulo(i) = atan(y(i)/x(i)) + pi;
            elseif y(i) < 0
                angulo(i) = atan(y(i)/x(i)) - pi;
            else
                angulo(i) = pi;   
            end
        else % Quando x(i) == 0
            if y(i) > 0
                angulo(i) = pi/2;
            elseif y(i) < 0
                angulo(i) = -pi/2;
            else % Quando x = 0 e y = 0
                angulo(i) = 0; % A direção não é definida
            end
        end
        % Converte o ângulo de radianos para graus
        angulo(i) = rad2deg(angulo(i));
    end
    
    % Cria uma tabela com os valores de entrada e os resultados calculados
    resultado = table(x', y', raio, angulo, 'VariableNames', {'x', 'y', 'raio', 'angulo'});
end
