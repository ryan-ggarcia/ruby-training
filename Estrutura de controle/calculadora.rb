# Calculadora em ruby

loop do
  puts "--Calculadora--"
  puts "**Digite 0 para incerrar"
  print "Digite um numero: "
  n1 = gets.chomp.to_i
  print "Digite o segundo numero: "
  n2 = gets.chomp.to_i
  print "Escolha um operação: "
  op = gets.chomp
  case op
  when "+"
    system('cls') || system('clear')
    result = n1 + n2
    puts "Resultado da soma #{result}"
    next
  when "*"
    system('cls') || system('clear')
    result = n1 * n2
    puts "Resultado da multiplicação #{result}"
    next
  when "-"
    system('cls') || system('clear')
    result = n1 - n2
    puts "Resultado da subtração #{result}"
    next
  when "/"
    system('cls') || system('clear')
    result = n1 / n2
    puts "Resultado da divição #{result}"
    next
  when "0"
    puts "Calculadora encerrada"
    break
  else
    puts "Opção não identificada..."
    next
  end
end
