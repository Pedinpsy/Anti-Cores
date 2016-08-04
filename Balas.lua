local anim8 = require 'anim8'
---------------Cooredenadas e Direção da Bala-------------------------
function atirarBalas()
    
    balas = {}  --Tabela de Atributos
    balas.img = imgDasBalas[math.random(0,#imgDasBalas)]  --Imagem
    balas.angulo = angulo  --Angulo de spawn  --Angulo da arma
    balas.width = balas.img:getWidth()   --Define Largura
    balas.heigth = balas.img:getHeight()   --Define Altura
    balas.x = tankX + math.cos(math.rad(angulo)) * -30  --Gerado em uma circunferecia do centro
    balas.y = tankY + math.sin(math.rad(angulo)) * -36  --Gerado em uma circunferecia do centro
    balas.incrementoX = math.cos(math.rad(angulo)) * -10  --Velocidade em X
    balas.incrementoY = math.sin(math.rad(angulo)) * -10  --Velocidade em Y
    balas.raio = 9 --Raio de colisão da bala
    balas.dano = 1 --Dano casuado
    table.insert(listaDeBalas, balas)
    
    foguinho = {} -- Tabela de atributos
    foguinho.x = tankX + math.cos(math.rad(angulo-7))*-55  --Ccoordenadas de spawn em X e rotação em coseno  
    foguinho.y = tankY + math.sin(math.rad(angulo-7))*-55   --Ccoordenadas de spawn em Y e rotação em seno
    foguinho.angulo = balas.angulo --Angulo de da torre
    foguinho.fire = love.graphics.newImage('Imagens/fire.png')  --Sprite do fogo do disparo
    foguinho.cont = 0 --contador auxiliar
    foguinho.fireGrid = anim8.newGrid(16,15, foguinho.fire:getWidth(), foguinho.fire:getHeight())  --Otem dimenssao de celula da grade do Sprite
    foguinho.fireAnim = anim8.newAnimation(foguinho.fireGrid(1,1, 1,2, 2,1, 2,1), 0.04)  --Coordenadas da Matriz/Grade do Sprite
    table.insert(listaAnim,foguinho)

end
---------------------------------------------------------------------