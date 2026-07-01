
class JuridicPerson < Person
  attr_accessor :cnpj
  def initialize(name,gender,wage,cnpj)
    super(name,gender,wage)
    @cnpj = cnpj
  end
  def readPerson
    puts "Name: #{@name}"
    puts "Gender: #{@gender}"
    puts "Wage: #{@wage}"
    puts "Cnpj: #{@cnpj}"
    puts "Money in bank: #{@cache}"
  end
end
