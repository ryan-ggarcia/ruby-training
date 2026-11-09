# Projeto orientado a objeto
class Animal
  def corre
    puts "Corre corre"
  end
  def dorme
    puts "ZZZzz"
  end
  def pula
    puts "poim poim"
  end
end
# herança
class Cachorro < Animal
  def latir
    puts "Rouf Rouf"
  end
end

cachorro = Cachorro.new
cachorro.corre
cachorro.pula
cachorro.latir
cachorro.dorme