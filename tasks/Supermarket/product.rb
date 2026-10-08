class Product
  attr_accessor :cod, :name, :price, :quantity, :status, :category
  def initialize(cod,name,price,quantity,category,status)
    @cod = cod
    @name = name
    @price = price
    @quantity = quantity
    @status = status
    @category = category
  end

  def to_s
    "Cod: #{cod} | Name: #{name} | Price: #{price} | Category: #{category} | Quantity: #{quantity} | Status: #{status}"
  end
end