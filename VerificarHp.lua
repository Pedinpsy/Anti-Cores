function mecanicaDeHp(bola,bala)
	bola.hp=bola.hp-bala.dano
end
function verificarMorteBola(bola,bala,listaBolaspika, j)
	if bolas.hp <=0 then
		table.remove(listaBolaspika, j)
	end
end