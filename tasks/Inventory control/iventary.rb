class Iventary
  def initialize
    @product = {}
  end
  def add_product(p,q)
    @product = {"ID"=>"#{p.id}","NAME" =>"#{p.name}","DEPARTAMENT"=>"#{p.departament}","PRICE"=>"#{p.price}","QUANTITY"=>"#{q}"}
  end
  def search b
    @product.each do |key,value|
      if value.nome == b
        aux = 



