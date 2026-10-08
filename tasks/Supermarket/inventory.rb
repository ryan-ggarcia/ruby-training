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
        puts("Enter the product cod\n")
        cod = gets.chomp
        puts("Enter the product name: \n")
        name = gets.chomp
        puts("Enter the product price: \n")
        price = gets.chomp
        puts("Enter the product quantity: \n")
        quantity = gets.chomp
        puts("Enter the product category: \n")
        category = gets.chomp

        if(cod.to_i.negative? || name.to_s.empty? || price.to_f.negative? || quantity.to_i.negative? || category.to_s.empty?)
          puts("Error... not fold")
          break
        end

        product = Product.new(cod, name, price, quantity, Category.new(category), true)
        @inventory << product

        puts("Do wish to add more products? Y | N")
        op = gets.chomp

        if(op.upcase == "N")
          break
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
