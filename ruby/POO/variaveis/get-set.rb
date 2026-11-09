# Por padrão todo método de instancia é Privado @ onde ela so pode ser acessada por um metodo
# Pegando e setando os valores privados
class Dog
  # nesse caso seria o nosso get
  def name
    @name
  end
  # e esse o nosso set
  def name= name # => parametro
    @name = name
  end
end

dog = Dog.new
dog.name = "Bradock"
puts dog.name

## Ou

class Carro 
  attr_accessor :ano, :marca
end
carro = Carro.new
carro.marca = 'Corsa'
carro.ano = '2005'
puts carro.marca
puts carro.ano

