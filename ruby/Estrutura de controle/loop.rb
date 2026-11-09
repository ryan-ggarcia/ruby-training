## loop
# Times
# Executa uma repetição por um determinado número de vezes
# do/while - loop
# Ele cria um laço de repetição que só parado quando uma instrução break for verdade

fruits = ['Corsa','Classic life','1.0']

for fruit in fruits
  puts fruit
end

x = 0
print 'Digite um numero: '
xt = gets.chomp.to_i
puts "Tabuada do #{xt}"
while x <= 10
  puts "#{x} X #{xt} = #{x * xt}" 
  x += 1
end

#loop do é parecido com do while a lógica é igual
cont = 1
loop do
  puts cont
  if(cont == 10) # Ele so para quando entra no if e aciona o break
    break
  end
  cont += 1
end

# times é um loop onde colocas a quantidade de vezes que algo via ser printado

10.times do 
  puts "Isso vai se repetir 10 vezes"
end