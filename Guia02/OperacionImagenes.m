function ImagenResultado = OperacionImagenes(Imagen1,Imagen2,op)
    if strcmp(op,'Suma')
        ImagenResultado = imadd(Imagen1,Imagen2);
    elseif strcmp(op,'Resta')
        ImagenResultado = imsubtract(Imagen1,Imagen2);
    elseif strcmp(op,'Multiplicacion')
        ImagenResultado = immultiply(Imagen1,Imagen2);
    elseif strcmp(op,'And')
        ImagenResultado = and(Imagen1,Imagen2);
    end
end

