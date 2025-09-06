function Y = imRotateTranslate(Imagen,theta,T,s)
    %
    % Este codigo rota la imagen respecto del origen (0,0) y despues la 
    % translada al punto arbitrario.
    %
    % A = [ ...
    %     s*cosd(theta) -s*sind(theta) 0; ...
    %     s*sind(theta) s*cosd(theta) 0; ...
    %     t(1) t(2) 1 ...
    %     ];
    % tform = affine2d(A);
    % Y = imwarp(Imagen,tform,'OutputView',imref2d(size(Imagen)));
    %
    % En cambio este codigo translada el centro de rotacion al origen,
    % realiza la rotacion y finalmente trasnlada de nuevo a su posicion
    % original

    R = [s*cosd(theta) -s*sind(theta); s*sind(theta) s*cosd(theta)];
    T_ = R*(-T)+T;  % T prima es mi vector de traslacion del centro
    A = [R T_; 0 0 1];  % Armo mi matriz de transformacion
    tform = affine2d(A');   % Creo el objeto de transformacion
    ref = imref2d(size(Imagen));    % Para guardar una referencia de tam
    Y = imwarp(Imagen,tform,"OutputView",ref);
end