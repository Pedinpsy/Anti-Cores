function verificaHp(bola,bala) --Decrementa HP das bolas com o dano das balas
	bola.hp = bola.hp - bala.dano
end

function verificaMorteBola(bola,bala,listaBolaspika,j) --Verifica morte da bola e remove da lista
	if bola.hp <=0 then
		      table.remove(listaBolaspika, j)
		      pontos = pontos+bola.valor
        if somGeral then
              love.audio.play(hit)
		end
    end
end