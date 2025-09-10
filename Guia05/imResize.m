function Y = imResize(X, s, C, metodo)
  % X: imagen de entrada (grises o RGB)
    % s: factor de escala (ej: 1.5 agranda, 0.5 achica)
    % C: centro [cx, cy] (columna, fila)
    % metodo: 'nearest' o 'bilinear'

    [rows, cols, ch] = size(X);
    Y = zeros(rows, cols, ch, 'like', X);  % salida con zero-padding
    
    cx = C(1);
    cy = C(2);
    
    for y = 1:rows
        for x = 1:cols
            % Mapeo inverso: de salida -> entrada
            xs = cx + (x - cx)/s;
            ys = cy + (y - cy)/s;
            
            if xs >= 1 && xs <= cols && ys >= 1 && ys <= rows
                switch metodo
                    case 'nearest'
                        xn = round(xs);
                        yn = round(ys);
                        Y(y,x,:) = X(yn,xn,:);
                        
                    case 'bilinear'
                        % Coordenadas base
                        x1 = floor(xs); x2 = ceil(xs);
                        y1 = floor(ys); y2 = ceil(ys);
                        
                        % Distancias
                        dx = xs - x1;
                        dy = ys - y1;
                        
                        % Asegurar indices válidos
                        if x1 < 1, x1 = 1; end
                        if y1 < 1, y1 = 1; end
                        if x2 > cols, x2 = cols; end
                        if y2 > rows, y2 = rows; end
                        
                        % Interpolación bilineal
                        Q11 = double(X(y1,x1,:));
                        Q21 = double(X(y1,x2,:));
                        Q12 = double(X(y2,x1,:));
                        Q22 = double(X(y2,x2,:));
                        
                        Y(y,x,:) = (1-dx)*(1-dy)*Q11 + dx*(1-dy)*Q21 + ...
                                   (1-dx)*dy*Q12     + dx*dy*Q22;
                end
            end
        end
    end
end