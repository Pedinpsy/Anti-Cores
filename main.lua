------classes---------------------------------------------------------
local anim8 = require 'anim8'
require "Balas"
require "Colisao"
require "Conf"
require "GerarBolas"
require "MecanicaDeHp"
require "Quadrante"
require "Porcentagem"
require "Rachadura"
require "reset"
require "Variaveis"
require "Round"


----------------------------------------------------------------------

-----------Pre Carregamento de Imagens e Audio--------------------------------
function love.load()
    --confg----
    love.graphics.setFont(font)
    -------
    
    -------------------------------------------
    arma = love.graphics.newImage("Imagens/metralha.png")
    base = love.graphics.newImage("Imagens/base.png")
    fundo = love.graphics.newImage("Imagens/fundo.png")
    vida = love.graphics.newImage("Imagens/coracao.png")
    somOn =love.graphics.newImage("Imagens/somOn.png")
    somOff =love.graphics.newImage("Imagens/somOff.png")
    som = love.graphics.newImage("Imagens/somOn.png")
    hp = love.graphics.newImage("Imagens/hp.png")
    play = love.graphics.newImage("Imagens/play.png")
    fundoMenu = love.graphics.newImage("Imagens/fundo_Menu2.png")
    t = love.graphics.newImage("Imagens/titulo1.png")
    coracao = love.graphics.newImage("Imagens/coracao.png")
    imgDasBalas[0]=love.graphics.newImage("Imagens/bala.png")
    voltar = love.graphics.newImage("Imagens/voltar.png")
    inicio = love.graphics.newImage("Imagens/inicio.png")
    bolaEspecial = love.graphics.newImage("Imagens/bolaEspecial.png")
    
    somMenu = love.audio.newSource("Sons/bass_menu.mp3")
    somTiro = love.audio.newSource("Sons/bass_tiro.mp3")
    hit = love.audio.newSource("Sons/hit.mp3")
    somPlay = love.audio.newSource("Sons/bass_play.mp3")
    Drive = love.audio.newSource("Sons/drive.wav")
    
    table.insert(imgDasBalas,love.graphics.newImage("Imagens/bala1.png"))
    table.insert(imgDasBalas,love.graphics.newImage("Imagens/bala2.png"))
     
    listaImgBolasPequenas[0] = love.graphics.newImage("Imagens/bolinha.png")
    table.insert(listaImgBolasPequenas,love.graphics.newImage("Imagens/bolinha2.png"))
    table.insert(listaImgBolasPequenas,love.graphics.newImage("Imagens/bolinha3.png"))
     
    listaImgBolasMedias[0] =love.graphics.newImage("Imagens/bolam1.png")
    table.insert(listaImgBolasMedias,love.graphics.newImage("Imagens/bolam2.png"))
    table.insert(listaImgBolasMedias,love.graphics.newImage("Imagens/bolam3.png"))

    listaImgBolasGrandes[0] = love.graphics.newImage("Imagens/bolag2.png")
    table.insert(listaImgBolasGrandes,love.graphics.newImage("Imagens/bolag1.png"))
    table.insert(listaImgBolasGrandes,love.graphics.newImage("Imagens/bolag3.png"))

    listaImgRachaduraGrande[0] = love.graphics.newImage("Imagens/rachadoGrande1.png")
    table.insert(listaImgRachaduraGrande,love.graphics.newImage("Imagens/rachadoGrande2.png"))
    table.insert(listaImgRachaduraGrande,love.graphics.newImage("Imagens/rachadoGrande3.png"))

    listaImgRachaduraMedia[0] = love.graphics.newImage("Imagens/rachadoMedio1.png")
    table.insert(listaImgRachaduraMedia,love.graphics.newImage("Imagens/rachadoMedio2.png"))
    
   
end
----------------------------------------------------------------------






--------------Ações--------------------------------------------------
function love.update(dt)

---JOGO RODANDO-----------------------------------
    if jogo == 1 then
        
        -------------animaçao do fogo-------
        for j, aux in ipairs(listaAnim) do
            aux.fireAnim:update(dt)
            aux.cont=aux.cont+1

            if(aux.fireAnim:getPosition() >=4) then
                table.remove(listaAnim,j)
            end
            
        end
    --audios     
    if(somGeral) then
        somPlay:setVolume(0.3)    
        love.audio.stop(somMenu)
        love.audio.play(somPlay)
    else
        love.audio.stop(somMenu)
        love.audio.stop(somPlay)
    end   
------------------------------        
--Gerador de tempo para spawn-
    if(os.clock()- UltimoGerado >= 0.5) then
        table.insert(vaiGerar,os.clock()+love.math.random(tempoGerarBolasMaximo,tempoGerarBolasMinimo))
        UltimoGerado = os.clock()
    end
----------------------------------------------------------------------------
--Spawn de bolaspika--
    for j, tempo in ipairs(vaiGerar)do
        if tempo < os.clock() then
            gerarBolas()
            table.remove(vaiGerar,j)
        end
    end
----------------------------------------------------------------------------
--Coordenadas apartir do centro--    
    x, y = 750 + math.cos(angulo) + 100, 350 + math.sin(angulo) + 100
    tempo = love.timer.getTime()
----------------------------------------------------------------------------
--Iniaciliza e movimenta os Projeteis--
    for i, balas in ipairs(listaDeBalas) do    
        balas.x = balas.x + balas.incrementoX
        balas.y = balas.y + balas.incrementoY
    end
----------------------------------------------------------------------------
--Comando de teclado--    
    if love.keyboard.isDown('space') then
        qualQuadrante()    
        if(delay<=0) then
            if(somGeral) then
                love.audio.play(somTiro)     
            end   
            atirarBalas()    
            delay=velocidadeTiro
        end
    end

    if love.keyboard.isDown('left') then
        angulo = angulo - 4
    end

    if love.keyboard.isDown('right') then
        angulo = angulo + 4
    end
       
     if love.keyboard.isDown('a') then
            if tankX > 43 then
            tankX = tankX - incrementoTank
            rotacaoTank = 0
            end    
    end
        
    if love.keyboard.isDown('d') then
            if tankX < 1350 then
            tankX = tankX + incrementoTank
            rotacaoTank = 0
            end    
    end    
    
    if love.keyboard.isDown('w') then
            if tankY > 43 then
            tankY = tankY - incrementoTank
            rotacaoTank = -1.56
            end    
    end      
    if love.keyboard.isDown('s') then
            if tankY < 680 then
            tankY = tankY + incrementoTank
            rotacaoTank = 1.56
            end    
    end 
    if  love.keyboard.isDown('a') and  love.keyboard.isDown('w') == true then
            rotacaoTank = 0.6
    end
    if  love.keyboard.isDown('a') and  love.keyboard.isDown('s') == true then
            rotacaoTank = -0.6
    end
    if  love.keyboard.isDown('d') and  love.keyboard.isDown('w') == true then
            rotacaoTank = 2.5
    end 
    if  love.keyboard.isDown('d') and  love.keyboard.isDown('s') == true then
            rotacaoTank = -2.5
    end
        
    if  love.keyboard.isDown('a') or love.keyboard.isDown('w') or love.keyboard.isDown('s') or love.keyboard.isDown('d') == true then
            if somGeral == true then
                    love.audio.play(Drive)
            else
                    love.audio.stop(Drive)        
            end
    else
            love.audio.stop(Drive)
    end
    if(delay>0) then
        delay=delay-1
    end 
----------------------------------------------------------------------------    
-- incremento bola e verifica colisão da bola com o tank
    for j, bolas in ipairs(listaBolaspika) do
        bolas.x = bolas.x + bolas.incrementoX
        bolas.y = bolas.y + bolas.incrementoY
        if ColisaoBolas(bolas.x, bolas.y, bolas.raio, tankX, tankY) == true then
            hpTank = hpTank-bolas.dano
            table.remove(listaBolaspika, j)    
        end
    end
-----------------------------------------------------------------------------   
--colisao bala com bola    
    for j, bolas in ipairs(listaBolaspika) do
        for i, balas in ipairs(listaDeBalas) do
            if ColisaoBalas(bolas.x, bolas.y, balas.x, balas.y, bolas.raio, balas.raio) == true then
                verificaHp(bolas,balas)
                verificaMorteBola(bolas,balas,listaBolaspika,j)
                table.remove(listaDeBalas, i)     
            end
        end  
    end
-----------------------------------------------------------------------------
-- Verificar se a bala saiu da tela --
    for i, balas in ipairs(listaDeBalas) do
        if(balas.x > largura or balas.x + balas.width < 0) then
            table.remove(listaDeBalas,i)
        end
        
        if(balas.y > altura or balas.y + balas.heigth < 0) then
            table.remove(listaDeBalas,i)
        end
    end
------------------------------------------------------------------------------
-- Verificar se a bola saiu da dela --
    for j, bolas in ipairs(listaBolaspika) do
        if(bolas.x > largura or bolas.x + bolas.width < 0) then
            table.remove(listaBolaspika, j)
        end
        
        if(bolas.y > altura or bolas.y + bolas.heigth < 0) then
            table.remove(listaBolaspika, j)
        end
    end    
------------------------------------------------------------------------------
-- teste-------
    balasNaLista=table.getn(listaDeBalas)
  --Rotacao selhoro
  elseif(jogo==2) then
        anguloBola=anguloBola+1
    
--JOGO NO GAME OVER--        
  elseif(jogo==3)then
        if auxJogo3 == 0 then
            for i=1,10 do
                gerarBolas()
                auxJogo3=1
            end
        end

-- Verificar se a bola saiu da dela --
        for j, bolas in ipairs(listaBolaspika) do
                if bolas.x > largura  or bolas.x <= -50 then
                    bolas.incrementoX=bolas.incrementoX*-1
                end
        
                if(bolas.y > altura or bolas.y <= -50) then
                    bolas.incrementoY=bolas.incrementoY*-1
                end
        end   
        for j, bolas in ipairs(listaBolaspika) do
                bolas.x = bolas.x + bolas.incrementoX
                bolas.y = bolas.y + bolas.incrementoY
       
        end 
------------------------------------------------------------------------------

   end
  
end
------------------------------------------------------------------------------

round(os.clock("%s") - tempoDepartida,0)


-----------Desenhar na tela--------------------------------------------------
function love.draw()
    if jogo == 1 then
        
        --fundo--
        love.graphics.draw (fundo, 750, 350, 0, 1, 1, 750, 350) 
        
        --base do tank--
        love.graphics.draw (base, tankX, tankY, rotacaoTank , 1, 1, 41.9215, 21.255)
    
        --informe de tempo--
        time = round(os.clock("%s") - tempoDepartida,0)
        
        tempoCor = {{0,0,0}, time ,} 
        
        love.graphics.print(tempoCor,100,25)    
        
        pontosCor = {{0,0,0}, pontos ,} 
                
        love.graphics.print(pontoslbl,love.graphics.getWidth() - (love.graphics.getWidth()*0.32),25)
        love.graphics.print(pontosCor,love.graphics.getWidth() - (love.graphics.getWidth()*0.10),25)
        
        --balas--
        for i, balas in ipairs(listaDeBalas) do
            love.graphics.draw(balas.img, balas.x, balas.y, math.rad(balas.angulo+270), 1,1,    balas.width/2, balas.heigth/2)
        end
            
        --torre do tank--
        love.graphics.draw (arma, tankX, tankY, math.rad(angulo+270), 1, 1, 18.1255, 46)
        
        --bolas
        for j, bolas in ipairs(listaBolaspika) do
            love.graphics.draw(bolas.img, bolas.x, bolas.y, 1, 1,1, bolas.raio, bolas.raio)
        end
        
        -- vida das bolas **momentaneo, pode apagar **
        for j, bolas in ipairs(listaBolaspika) do
            imgRachadura(bolas)    
        end
        
        --desenha vidas do tank
        for auxilar=1, hpTank do
            love.graphics.draw(coracao,560+auxilar*60 ,90, 0, 1, 1, coracao:getWidth(), coracao:getHeight())
        end
        
        --verifica vida do tank
        if(hpTank<=0)then
            love.audio.stop(Drive)
            love.audio.stop(somPlay)
            love.graphics.print(coloredtext,300,250,0,2,2)
            --JOGO GAMEOVER
            jogo = 3
            
        end

end  
    
--DESENHA MENU 
      if(jogo==2)then
          
            love.graphics.draw (bolaEspecial, 715, 450,math.rad(anguloBola+270),1,1,bolaEspecial:getWidth()/2,bolaEspecial:getHeight()/2)
            love.graphics.draw (fundoMenu, 750, 350, 0, 1, 1, 750, 350)
            love.graphics.draw (t, 750, 150, 0, 1, 1, 544, 117)
            love.graphics.draw(som, 1300,650, 0,1,1, som:getWidth(), som:getHeight())
            if(somGeral) then
                love.audio.play(somMenu)    
            else
                love.audio.stop(somMenu)
            end 
    end 
    
---animaçao da rotação do fogo do disparo --
    for j, aux in ipairs(listaAnim) do
            aux.fireAnim:draw(aux.fire, aux.x, aux.y,math.rad(aux.angulo+270))
    end
----------------------
--Desenha tela de game 
   if(jogo==3) then
        
        love.graphics.draw (fundo, 750, 350, 0, 1, 1, 750, 350)
        for j, bolas in ipairs(listaBolaspika) do
            love.graphics.draw(bolas.img, bolas.x, bolas.y, 1, 1,1, bolas.raio, bolas.raio)
        end
        pontosMaximos = {{0,0,0},pontos}
        love.graphics.print(coloredtext,400,100,0,1.5)
        love.graphics.print(pontoslbl,450,250)
        love.graphics.print(pontosMaximos,755,250)
        love.graphics.draw(voltar,550, 370,0,2)
        love.graphics.draw(inicio,700,370)
   end
    
end    
------------------------------------------------------------------------------

function love.mousereleased(x, y, button)
    --Botao PLAY
    if button==1 and jogo == 2 and x>808-bolaEspecial:getWidth() and x<808 and y>544.5-bolaEspecial:getHeight() and y<544.5  then
       
           jogo = 1
        
    end
    --Botao SOM
     if button==1 and jogo == 2 and x>1300-som:getWidth() and x<1300 and y>650-som:getWidth() and y<650  then
       
            if(somGeral == true) then
            som=somOff
            somGeral = false
            else
                 som=somOn
            somGeral = true
            end
        
    end
    --Botao Retorno MENU
    if button==1 and jogo==3 and x>550 and x<550+(voltar:getWidth()*2) and y>370 and y<370+(voltar:getHeight()*2) then        
        reset()
        jogo = 1
        auxJogo3=0
    end
    --Botao RESET
    if(button==1 and jogo==3 and x>700 and x<700+inicio:getWidth() and y>370 and y<370+inicio:getHeight()) then
        reset()
        jogo = 2
        auxJogo3=0
    end
    
end
