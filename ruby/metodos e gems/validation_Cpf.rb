# Siga a documentação da gem, CPF_CNPJ para criar um programa que recebe como entrada um número de CPF
# e em um método verifique se este número é válido.

require "cpf_cnpj" #Carrega a gem externa. Sem isso, as classes CPF e CNPJ não existem no programa.

print "Digite o seu cpf ou cnpj: "
number = gets.chomp

if number.size == 11 # compara se é cpf ou cnpj
  tipo = "CPF"  
  cpf = CPF.new(number) 
elsif number.size == 14
  tipo = "CNPJ"
  cpf = CPF.new(number) 
else
  puts "Puts... deu erro"
  exit
end
# Cria um objeto CPF. A gem guarda o número internamente e já sabe fazer os cálculos de validação. 
# Você passa o número (pode ser com ou sem formatação: "123.456.789-09" ou "12345678909").

if cpf.valid?
  puts "#{tipo} correto! #{cpf.formatted}" #formata
else
  puts "CPF OU CNPJ incorretos"
end