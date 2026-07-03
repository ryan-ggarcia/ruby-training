class Product
  attr_accessor :id,:name,:departament,:price
  def initialize(id,name,departament,price)
    @id = id
    @name = name
    @departament = departament
    @price = price
  end
end
