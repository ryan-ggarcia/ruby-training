# Interações com Array

#Criar uma variavel onde vai ser o array
estados = []
estados.push('Rio,Bahia,Minas,São Paulo, Nordeste')

#exibindo
estados[1..5]

# pega o primeiro
estados.first
# pega o segundo ou o ultimo(se o array for maior que 2)
estados.last
# conta o tamanho do array
estados.count
# busca se no array exites essa palavra
estados.include?('Rio')
# excluir um posição
estados.delete_at(2)
# excluir o utimo item do array
estados.pop
# para excluir o primeito item do array
estados.shift

