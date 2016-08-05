---Retorna as variaaveis aos Valores iniciais
function reset()
    
    listaAnim = {}
    pontos=0
    hpTank = 3

    velocidadeTiro = 10 --delay de tiro
    angulo = 0
    rotacao = -1.50
    quadrante = "quadrante"
    delay = 0
    if(jogo ~= 1)then
    listaBolaspika = {}
    listaDeBalas = {}
    end
    ---test---
    balasNaLista = 0
    tempoGerar = 0

    -- velocidade de movimento minimo e maximo da bola
    incrementoMinimo = 1
    incrementoMaximo = 4
    font = love.graphics.newFont("fontePica.ttf", 72)
    --
    UltimoGerado = 0

    -- tempo minimo e tempo maximo que pode ser gerado uma nova bola
    tempoGerarBolasMinimo = 1
    tempoGerarBolasMaximo = 3
    tempoDepartida = os.clock("%s")
    -------
tankX = 700
tankY = 350
incrementoTank = 2
rotacaoTank = 0
    
    
end