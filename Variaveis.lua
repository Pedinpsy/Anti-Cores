----Variaveis e tabelas Globais---------------------------------------
local fire, fireAnim
listaAnim = {}
pontos=0
anguloBola=0

listaImgRachaduraGrande = {}
listaImgRachaduraMedia = {}
listaBolaspika={}
listaImgBolasGrandes = {}
listaImgBolasMedias = {}
listaImgBolasPequenas = {}
listaDeBalas = {}
listaDebolas = {}
imgDasBalas = {}
imgEspeciais = {}
listaImgDasBalasEspeciais = {}

velocidadeTiro = 10 --delay de tiro
angulo = 0
rotacao = -1.50
quadrante = "quadrante"
delay = 0
largura = 1500
altura = 700
tiposDeBolas={"grande","pequena","media"}
tiposDeBolasEspeciais={"velocidade","variosTiros"}
jogo = 2
hpTank = 3
somGeral = true
auxJogo3=0
---test---
balasNaLista=0
tempoGerar = 0
especialAtivado = false
especialFim=0
-- velocidade de movimento minimo e maximo da bola
incrementoMinimo = 1
incrementoMaximo = 4
font2 = love.graphics.newFont("fontePica.ttf", 72)
font = love.graphics.newFont("fontePic.ttf", 35)
--
UltimoGerado = 0

-- tempo minimo e tempo maximo que pode ser gerado uma nova bola
tempoGerarBolasMinimo = 1
tempoGerarBolasMaximo = 3
tempoDepartida = 0
-------
vaiGerar={}
coloredtext = {{0,0,0}, "GAME OVER",}

pontoslbl = { {0,0,0}, "Pontos  " ,}


tankX = 700
tankY = 350
incrementoTank = 2
rotacaoTank = 0

geradorEspecial=999
----------------------------------------------------------------------