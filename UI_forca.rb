def dar_boas_vindas
	puts "\n\n"
	puts "************   Seja bem vindo, e prepare-se para perder!   ************"
	puts "\n"
	puts "Qual é o seu nome perdedor?"
	nome = gets.strip
	nome
end

def mostra_campeao dados
	puts "\n"
	puts "********* *** *********"
	puts "O maior pontuador é #{dados[0]} com #{dados[1]} pontos!"
	puts "********* *** *********"
end

def avisa_escolhendo_palavra nome
	puts "\n\n\n"
	puts "#{nome} estamos escolhendo a palavra que irá frustrar suas tentativas!"
end

def avisa_palvra_escolhida palavra_secreta
	puts "\n"
	puts "O seu destino está traçado... a palavra tem #{palavra_secreta.size} letras."
	puts "Boa sorte!"
end

def desenha_forca erros
    cabeca = "   "
    corpo = " "
    pernas = "   "
    bracos = "   "
    if erros >= 1
        cabeca = "(_)"
    end
    if erros >= 2
        bracos = " | "
        corpo = "|"
    end
    if erros >= 3
        bracos = "/|\\"
    end
    if erros >= 4
        pernas = "/ \\"
    end

    puts "  _______       "
    puts " |/      |      "
    puts " |      #{cabeca}  "
    puts " |      #{bracos}  "
    puts " |       #{corpo}  "
    puts " |      #{pernas}  "
    puts " |              "
    puts "_|___           "
    puts

end

def cabecalho_chute erros, chutes
	puts "\n\n"
	puts "Erros até agora #{erros}..."
	puts "Seus chutes até agora foram: #{chutes}"
end

def dar_um_chute mascara
	puts "\n\n"
	puts "Por enquanto temos: #{mascara}"
	puts "Chute uma letra ou uma palavra e falhe miseravelmente."
	puts "Sua tentativa:"
	chute = gets.strip.downcase
	chute
end

def chute_mascaradinho	palavra_secreta, chutes
	mascara = ""
	for letra in palavra_secreta.chars
		if chutes.include? letra
			mascara << letra
		else
			mascara << "_"
		end
	end
	mascara
end

def palpite_repetido
	puts "\n\n"
	puts "Você já tentou essa, por favor tente uma nova."
end

def mensagem_erro
	puts "Como esperado... Errado!"
end

def contador_de_letras palavra_secreta, chute
	letra_procurada = chute[0] # => variavel, não lista
	quantidade_letras = 0
	for i in 0..(palavra_secreta.size-1) # ou .count 
		if palavra_secreta[i] == letra_procurada
			quantidade_letras += 1
		end
	end
	quantidade_letras
end

def numero_de_letras quantidade_letras
	puts "Essa letra aparece #{quantidade_letras} vezes nesta palavra..."
end

def missao_cumprida 
	puts "\n\n"
	puts "Impossível! parece que você contrariou as expectativas..."
	puts "\nParabéns, você ganhou!"
    puts

    puts "       ___________      "
    puts "      '._==_==_=_.'     "
    puts "      .-\\:      /-.    "
    puts "     | (|:.     |) |    "
    puts "      '-|:.     |-'     "
    puts "        \\::.    /      "
    puts "         '::. .'        "
    puts "           ) (          "
    puts "         _.' '._        "
    puts "        '-------'       "
    puts
end

def falha_na_missao
	puts "Como esperado... Errado!"
end

def pontuacao_acumulada pontos_ate_agora
	puts "Ora ora, você fez #{pontos_ate_agora} pontos!"
end

def avisa_pontos_totais pontos_totais, dados
	puts "Você acumulou #{pontos_totais} pontos!"
	if dados[1].to_i < pontos_totais
		puts "*** New Record ***"
	end
end

def try_again nome
	puts "\n\n\n"
	puts "Você deseja jogar novamente #{nome}? (S/N)"
	quer_jogar_novamente = gets.strip
	quer_jogar_novamente
end

