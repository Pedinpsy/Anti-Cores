------Define listas de atributos para as bolas sendo que a principal eh uma matriz tetradimensional para selecao aleatoria diferentes classes  
function gerarBolas()
    local bolas = {}
    bolas.especial=false
    if(geradorEspecial>=1000) then
        geradorEspecial=0
        bolas.tipo= tiposDeBolasEspeciais[love.math.random(1,#tiposDeBolasEspeciais)]
        bolas.especial=true
    else
    bolas.tipo = tiposDeBolas[love.math.random(1,#tiposDeBolas)]
    end
    if( bolas.tipo=="grande") then 
        bolas.valor=50
        bolas.hpMax=5
        bolas.hp=5
        bolas.img = listaImgBolasGrandes[love.math.random(1,#listaImgBolasGrandes)]
        bolas.width = bolas.img:getWidth()
        bolas.heigth = bolas.img:getHeight()
        bolas.raio = 120
        bolas.dano=3
        
        elseif(bolas.tipo == "media") then
            bolas.valor=20
            bolas.hpMax=3
            bolas.hp=3
            bolas.img = listaImgBolasMedias[love.math.random(0,#listaImgBolasMedias)]
            bolas.width = bolas.img:getWidth()
            bolas.heigth = bolas.img:getHeight()
            bolas.raio = 60
            bolas.dano=2
        
        elseif(bolas.tipo == "velocidade")then
            bolas.valor=50
            bolas.hpMax=1
            bolas.hp=1
            bolas.img = imgEspeciais[1]
            bolas.width = bolas.img:getWidth()
            bolas.heigth = bolas.img:getHeight()
            bolas.raio = bolas.img:getWidth()/2
            bolas.dano=3
        elseif(bolas.tipo == "variosTiros")then
            bolas.valor=50
            bolas.hpMax=1
            bolas.hp=1
            bolas.img = imgEspeciais[2]
            bolas.width = bolas.img:getWidth()
            bolas.heigth = bolas.img:getHeight()
            bolas.raio = bolas.img:getWidth()/2
            bolas.dano=3

        else
            bolas.valor=10
            bolas.hpMax=1
            bolas.hp=1
            bolas.img = listaImgBolasPequenas[love.math.random(0,#listaImgBolasPequenas)]
            bolas.width = bolas.img:getWidth()
            bolas.heigth = bolas.img:getHeight()
            bolas.raio = 30
            bolas.dano=1
    end

    --se for 1 x == 0 e y aleatorio, incrementox positivo, 
    --se for 2 x == 1500 y aleatorio incremento xnegativo
    --se for 3 y == 0 x aleatorio incrementoy positivo
    --se for 4 y == 700  x aleatorio incrementoy negativo
    --Geracao randomica das bolas em todos os lados da tela 
    local aux = love.math.random(1,4)
    
    if(aux==1) then
        bolas.x = 0
        bolas.y = love.math.random(1,750)
        bolas.incrementoX = love.math.random(incrementoMinimo,incrementoMaximo)
        bolas.incrementoY = love.math.random(incrementoMinimo,incrementoMaximo)
    elseif(aux==2) then
        bolas.x = 1500
        bolas.y = love.math.random(1,750)
        bolas.incrementoX = -1*love.math.random(incrementoMinimo,incrementoMaximo)
        bolas.incrementoY = love.math.random(incrementoMinimo,incrementoMaximo)
    elseif(aux==3) then
        bolas.x = love.math.random(1,1500)
        bolas.y = 0
        bolas.incrementoX = love.math.random(incrementoMinimo,incrementoMaximo)
        bolas.incrementoY = love.math.random(incrementoMinimo,incrementoMaximo)
    else
        bolas.x = love.math.random(1,1500)
        bolas.y = 700
        bolas.incrementoX = love.math.random(incrementoMinimo,incrementoMaximo)
        bolas.incrementoY = -1 * love.math.random(incrementoMinimo,incrementoMaximo)
    end
   -- if(bolas.especial)then
       -- bolas.incrementoX = 1
       -- bolas.incrementoY = 1
   -- end
    table.insert(listaBolaspika,bolas)
    
end

------------------------------------------------------------------------------------------------------