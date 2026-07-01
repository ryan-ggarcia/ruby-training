class Person
  attr_accessor :name, :gender, :wage, :cache
  def initialize(name,gender,wage)
    @name = name
    @gender = gender
    @wage = wage.to_f
    @cache = 0.0
  end
end