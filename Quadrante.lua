----------------Quadrantes de Rotação--------------------------------
function qualQuadrante()
    
    quadrante= "funcionando"
    if(angulo%360 > 0 and angulo%360 <90)  then
        quadrante="segundo"
    end
    if(angulo%360>=90 and angulo%360<=180) then 
        quadrante="primeiro"
    end
    if(angulo%360>=180 and angulo%360<=270) then 
         quadrante="quarto"

    end
    if(angulo%360>=270 and angulo%360<=360) then 
        quadrante="terceiro"

    end
    
end
---------------------------------------------------------------------