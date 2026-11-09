name = 'fidelis'
if name == 'ryan'
  msg = "Seja bem vindo #{name}"
else
  msg = 'Quem é você?'
end

puts msg

# O comando unless no Ruby funciona exatamente como o oposto de um if. 
#Ele executa o bloco de código apenas se a condição avaliada for falsa
x = 1
unless x == 2
  puts "x é diferente"
else
  puts "x é igual "
end

# case é um estritura parecida com switch

print "Digite o numero do mes de seu nascimento:"
#Em Ruby, o método .to_i significa "para inteiro" (to integer). 
#Ele é usado para converter dados de outros tipos (como strings ou decimais) em números inteiros
mes = gets.chomp.to_i

case mes
when 1..3
  puts "Você nascel no inicio do ano!"
when 4..6
  puts "Uau você nascel na metade do ano!"
when 7..9
  puts "Vixi você foi feito no carnaval KSKSKSKSKSK" 
when 10..12
  puts "Falta pouco para o fim do ano em"
else
  puts "Escolhe um opção valida ai (do 1 ao 12)"
end
   

