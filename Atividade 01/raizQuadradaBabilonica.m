function [raiz, erro] = raizQuadradaBabilonica()
    % Solicita ao usuário que insira o valor de a
    a = input('Qual o valor de a? ');
    estimado = 1e-4; % Define a estimação para o erro permitido
    
    % Verifica se o número é negativo
    if a < 0
        raiz = sqrt(-a) * 1i; % Calcula a raiz quadrada de um número negativo (imaginário)
        erro = 0; % Não há erro no cálculo de raízes imaginárias
        fprintf('Raiz: %f + %fi, Erro: %.10f\n', real(raiz), imag(raiz), erro); % Exibe a raiz e o erro
        return;
    elseif a == 0
        raiz = 0; % A raiz quadrada de 0 é 0
        erro = 0; % Não há erro
        fprintf('Raiz: %f, Erro: %.10f\n', raiz, erro); % Exibe a raiz e o erro
        return;
    end
    
    % Inicializa a aproximação inicial com o valor de a
    xVelho = a;
    xNovo = (xVelho + a / xVelho) / 2;
    
    while true
        % Calcula o erro relativo entre as aproximações
        erro = abs(xNovo - xVelho) / xNovo;
        
        % Verifica se o erro está dentro da tolerância
        if erro <= estimado
            break;
        end
        
        % Atualiza as aproximações para a próxima iteração
        xVelho = xNovo;
        xNovo = (xVelho + a / xVelho) / 2;
    end
    
    % A raiz aproximada é o valor final de xNovo
    raiz = xNovo;
    fprintf('Raiz: %f, Erro: %.10f\n', raiz, erro); % Exibe a raiz e o erro com precisão
end