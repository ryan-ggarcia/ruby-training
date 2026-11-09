user = {}
loop do
  #system("clear") || system("cls")
  puts "--Menu--"
  puts "1- Cadastrar user"
  puts "2- Exibir user"
  puts "3- Excluir user"
  puts "4- Sair"
  print "Escolha um opção:"
  op = gets.chomp.to_i
  case op
  when 1
    print "Qual é o seu nome?"
    nome = gets.chomp
    print "Sua idade: "
    idade = gets.chomp.to_i
    user[:nome] = nome
    user[:idade] = idade
    next
  when 2
    if !user.empty?
      puts "Dados do user"
      puts "Nome: #{user[:nome]} e Idade: #{user[:idade]}" #interpolação com hash
    else
      puts 'Nem um User foi encontrado'
    end
  when 3
    if !user.empty?
      puts "Dados apagados com sucesso"
      user.clear
    else
      puts "User não cadastrado!"
    end
    next
  when 4
    puts "Sistema finalizado"
    break
  else
    puts "Opção invalida"
    next
  end
end

# empty? — retorna true se o hash não tem pares chave/valor.
# next — pula para a próxima iteração do loop (sem sair do método).
# user.clear — remove todas as chaves/valores do hash (alternativa a user = {}).