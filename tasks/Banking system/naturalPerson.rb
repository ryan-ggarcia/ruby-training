
class NaturalPerson < Person
  attr_accessor :cpf
  def initialize (name,gender,wage,cpf)
    super(name,gender,wage)
    @cpf = cpf
  end
  def readPerson
    puts "Name: #{@name}"
    puts "Gender: #{@gender}"
    puts "Wage: #{@wage}"
    puts "Cpf: #{@cpf}"
    puts "Money in bank: #{@cache}"
  end
end