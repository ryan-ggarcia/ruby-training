# each => Percorre uma coleção de forma parecida com o for,
#         porem, noa sobrescrevendo o valor de variveis fora da estrutura de repstição

# map => Cria um array baseando-se em valores de outro array existente 

# select => realiza um seleção de elementos presentes em uma collection atraves de um condição pré definida. 
#           Traz como resultado somente os valores que passam nesta condição

# each com array
# names = ['Ryan', 'Leo', 'Marcos', 'Felipe']
# name = 'Murilo'
# names.each do |name|
#   puts name
# end
# puts name

# each com hash
# aulas = { 'Aula1' => 'Liberado', 'Aula2' => 'liberado' }
# aulas.each do |keys,value|
#   puts "#{keys} esta #{value}"
# end

# map com array
# array = [1,2,3,4,5]
# new_array = array.map do |valor|
#   valor * 2 # aqui ele esta pengando o valor do array e multiplicando por 2
# end
# puts "Array Original: #{array}"
# puts "Array criado pelo map: #{new_array}"
# nesse metodo o array ira RECEBER os novos valores do map
origin_array = [1,2,3,4,5]
# para isso adicionamos ! no map
origin_array.map! do |valor| 
  valor * 2
end
puts "Array com o seus valores modificados: #{origin_array}"
