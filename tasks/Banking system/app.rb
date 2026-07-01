require './person.rb'
require './naturalPerson.rb'
require './juridicPerson.rb'

class Bank
  def deposit (v,p)
    if v.to_f < p.wage
      p.cache += v.to_f
      p.wage -= v.to_f
      puts "Your deposited #{v} dollers"
    end
  end
  def sake (v,p)
    if v.to_f >= p.cache
      puts "Your withdrawal request could not be completed"
    else
      p.cache -= v.to_f
      p.wage +=v.to_f
    end
  end 
end

person = NaturalPerson.new('Ryan','Human',1200,'483')
bank = Bank.new
bank.deposit(1000,person)
person.readPerson
