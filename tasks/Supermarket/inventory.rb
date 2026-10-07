require "./product.rb"
require "./category"
class Inventory
  attr_reader :inventory, :capacity_max

  def initialize
    @inventory = []
    @capacity_max = 10
  end

  def add_product()
    if @inventory.size < @capacity_max
      loop do
        puts("Enter the product name: \n")
        name = gets.chomp
        puts("Enter the product price: \n")
        price = gets.chomp
        pust("Enter the product quantity: \n")
        quantity = gets.chomp
        pust("Enter the product category: \n")
        category = gets.chomp

        if( name.to_s.empty? || price.to_f.negative? || quantity.to_i.negative? || category.to_s.empty?)
          puts("Error... not fold")
        end


      end
    end
  end

  def read_products
    @inventory.each do |inv|
      puts(inv)
      puts("--------------------------")
    end
  end
end
