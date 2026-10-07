class Product
  attr_accessor :name, :price, :quantity, :status, :category
  def initialize(name,price,quantity,category,status)
    @name = name
    @price = price
    @quantity = quantity
    @status = status
    @category = category
  end

  def to_s
    "Name: #{name} | Price: #{price} | Category: #{category} | Quantity: #{quantity} | Status: #{status}"
  end
end