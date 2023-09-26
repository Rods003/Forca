def rank nome, pontos_totais
	conteudo = "#{nome}\n#{pontos_totais}"
	File.write "rank.txt", conteudo
end

def le_rank
	score = File.read "rank.txt"
	score.split "\n"
end

def campeao_superado dados, nome, pontos_totais 
	if dados[1].to_i < pontos_totais
		rank nome, pontos_totais
	end
end