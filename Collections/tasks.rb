# utilizando uma colletion do tipo array, escreva um programa que revaba 3 números e no final 
# exiba o resultado de cada um deles elevado a segunda potência

array = []
print "Digite um numero:"
array.push(gets.chomp.to_i)
print "Digite um numero:"
array.push(gets.chomp.to_i)
print "Digite um numero:"
array.push(gets.chomp.to_i)

print "Valor inicial #{array}"

array.map! do |values|
  values ** 2
end

print "\nArray elevado a segunda potencia #{array}"

# Crie uma collection do tipo hash e permita que  usuário crie três elementos informando  
# a chave e o valor. No final do programa para cada um desses elementos imprima a frase
# "Uma das chaves é *** e o seu valor é ***"
hash = {}
for i in 1..3
  print "\nDigite um chave: "
  key = gets.chomp
  print "\nDigite um valor: "
  value = gets.chomp
  hash[:"#{key}"] = "#{value}"
end

hash.each do |key,values|
  puts "Umas das chaves é: #{key} e o seu valor é: #{values}"
end

# Dado o seguinte hash Numbers = {A:10, B:20, C:20,D:25, E:15}
# Crie um instrução que selecione o maior valor deste hash e no final imprima a chave e valor
# do elemento resultante.

maior = 0
key = ""
numbers = {'A':10, 'B':30, 'C':20,'D':250, 'E':15}
numbers.each do |keys,values|
  if values > maior
    maior = values
    key = keys
  end
end
puts "O maior elemento do hash é #{key} => #{maior}"    



