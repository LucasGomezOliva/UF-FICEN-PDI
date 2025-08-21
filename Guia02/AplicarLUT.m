function img_out = AplicarLUT(img_in, LUT)
    % AplicarLUT - Aplica una Look-Up Table (LUT) a una imagen en escala de grises
    %
    % Sintaxis:
    %   img_out = AplicarLUT(img_in, LUT)
    %
    % Entradas:
    %   img_in : Imagen en escala de grises (tipo uint8, valores [0,255])
    %   LUT    : Vector de 256 elementos, con valores en el rango [0,255]
    %
    % Salida:
    %   img_out : Imagen transformada según la LUT
    
    % Verificaciones básicas
    if ~isa(img_in, 'uint8')
        error('La imagen debe estar en formato uint8 (0-255).');
    end
    
    if numel(LUT) ~= 256
        error('La LUT debe tener exactamente 256 elementos.');
    end
    
    % Asegurarse que LUT sea de tipo uint8
    LUT = uint8(LUT);
    
    % Aplicar LUT (vectorización)
    img_out = LUT((img_in) + 1); 
    % Se suma +1 porque en MATLAB los índices empiezan en 1 y no en 0
end
