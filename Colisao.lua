--Funcoes de teste de colisao pela distancia euclidiana Bidimencional (Teorema de Pit.)

function ColisaoBolas(x, y, r, tankX, tankY) --Define Raio de colisao do tank com as bolas
    catetoX = x  - tankX
    catetoY = y  - tankY
    hipot = math.sqrt(catetoX^2 + catetoY^2)
    
    if hipot < (r + 43) then
        return true
    else
        return false
    end
    
end

function ColisaoBalas(bolaX, bolaY, balaX, balaY, rBola, rBala) --Define raio de colisao das projeteis  
    catetoX = bolaX - balaX
    catetoY = bolaY - balaY
    hipot = math.sqrt(catetoX^2 + catetoY^2)
    
    if hipot < (rBola + rBala) then
        return true
    else
        return false
    end
    
end
---------------------------------------------------------------------------------