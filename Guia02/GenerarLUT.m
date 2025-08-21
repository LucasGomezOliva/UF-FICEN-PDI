function LUT = GenerarLUT(brillo, contraste)
    % GenerarLUT - Crea una Look-Up Table (LUT) de 256 elementos
    % aplicando ajuste de brillo y contraste.
    %
    % Sintaxis:
    %   LUT = GenerarLUT(brillo, contraste)
    %
    % Entradas:
    %   brillo    : Ajuste de brillo (valor a sumar, puede ser positivo o negativo)
    %   contraste : Factor de contraste (ej: 1 = sin cambio, >1 aumenta contraste)
    %
    % Salida:
    %   LUT : Vector uint8 de 256 elementos
    
    % Crear vector de intensidades originales (0 a 255)
    x = 0:255;
    
    % Transformación lineal
    LUT = contraste * x + brillo;
    
    % Saturar valores fuera del rango [0,255]
    LUT(LUT < 0)   = 0;
    LUT(LUT > 255) = 255;
    
    % Convertir a tipo uint8
    LUT = uint8(LUT);
end
