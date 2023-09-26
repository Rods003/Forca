require_relative 'UI_forca'	
require_relative 'rank'	

def escolhe_palavra_secreta nome
	avisa_escolhendo_palavra nome
	lista = File.read("dicionario.txt")
	todas_palavras = lista.split "\n" 
	palavra_secreta = todas_palavras[rand(todas_palavras.size)].downcase
	avisa_palvra_escolhida palavra_secreta
	palavra_secreta
end


def valida_chute erros, chutes, mascara
	cabecalho_chute erros, chutes
	loop do
		chute = dar_um_chute mascara
		if chutes.include? chute
			palpite_repetido
		else
			return chute
		end
	end
end

def jogar nome
	palavra_secreta = escolhe_palavra_secreta nome

	erros = 0
	chutes = []
	pontos_ate_agora = 0
	

	while erros < 5
		mascara = chute_mascaradinho palavra_secreta, chutes
		chute = valida_chute erros, chutes, mascara
		
		chutes << chute
		
		letra_chutada = chute.size == 1
		if letra_chutada
			quantidade_letras = contador_de_letras palavra_secreta, chute
			if quantidade_letras == 0 
				mensagem_erro
				erros += 1
				pontos_ate_agora -= 20
			else
				numero_de_letras quantidade_letras
			end
		else
			if chute == palavra_secreta
				missao_cumprida 
				pontos_ate_agora += 100
				break
			else
				falha_na_missao
				erros += 1
				pontos_ate_agora -= 20
			end
		end
	end
	pontuacao_acumulada pontos_ate_agora
	pontos_ate_agora
end

def nao_jogar_novamente nome
	quer_jogar_novamente = try_again nome
	nao_jogar_novamente = quer_jogar_novamente.upcase == "N"
end

def jogo_da_forca
	nome = dar_boas_vindas
	mostra_campeao le_rank
	pontos_totais = 0
	loop do
		pontos_totais += jogar nome
		avisa_pontos_totais pontos_totais, le_rank
		campeao_superado le_rank, nome, pontos_totais 
		if nao_jogar_novamente nome
			break
		end
	end
end