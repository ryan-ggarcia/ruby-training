# Para utilizarmos o contructor precisamos declarar como initialize

class Person

  def initialize(name,age)
    @name = name
    @age = age
  end
  def saudacao
    puts "instancia de classe iniciada com valores:"
    puts "Nome: #{@name}"
    puts "Idade: #{@age}"
  end
end
person = Person.new('Ryan',19)
person.saudacao