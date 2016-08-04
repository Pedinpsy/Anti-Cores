--Define Rachadura por dano
function imgRachadura(bolinhas)
    if(bolinhas.hp ~= bolinhas.hpMax)then
        if bolinhas.tipo == "grande" then
            local x = ((table.getn(listaImgRachaduraGrande) * PorcentagemDeVida(bolinhas)) / 100)
            return love.graphics.draw(listaImgRachaduraGrande[table.getn(listaImgRachaduraGrande)-round(x,0)], bolinhas.x, bolinhas.y,1,1,1, bolinhas.raio, bolinhas.raio)   
        end 
        if bolinhas.tipo == "media" then
            local x = ((table.getn(listaImgRachaduraMedia)*PorcentagemDeVida(bolinhas))/100)
            return  love.graphics.draw(listaImgRachaduraMedia[table.getn(listaImgRachaduraMedia)-round(x,0)], bolinhas.x, bolinhas.y,1,1,1, bolinhas.raio, bolinhas.raio)  
        end 
    end
end