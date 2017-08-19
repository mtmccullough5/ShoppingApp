class Store #This is a place a shopper wants to go
  attr_accessor :name, :inventory, :cart
  def initialize(name)
    @name = name
    apple = FoodItem.new("Apple", 0.50)
    banana = FoodItem.new("Banana", 0.19)
    bread = FoodItem.new("Bread", 1.99)
    cake = FoodItem.new("CAke", 4.99)
    cereal = FoodItem.new("Capt Crunch", 2.99)
    
    inventory = [
      {name: apple, quantity: 3},
      {name: banana, quantity: 3},
      {name: bread, quantity: 3},
      {name: cake, quantity: 3},
      {name: cereal, quantity: 3}]
    @inventory = inventory
    @cart = []
  end
  def store_front
    puts "   Item\t\t    Price   \t Quantity"
    (0..@inventory.length-1).each \
     {|x| puts "#{x+1}) #{@inventory[x][:name].name} \t \
     #{@inventory[x][:name].cost}  \t \
     #{@inventory[x][:quantity]}"} 
    print "Enter Item You would like to add to Cart:"
    item_num = 4 #gets.to_i - 1
    puts "How many?"
    item_q = 2 #gets.to_i
    @inventory[item_num][:quantity] = @inventory[item_num][:quantity]-item_q
    @cart.insert(item_num,@inventory[item_num])
    @cart[item_num][:quantity] = item_q
    view_cart(item_num,item_q)
    
  end
  def view_cart(item_num,item_q)
    puts "#{item_q} #{@inventory[item_num][:name].name} have been added to your cart"
    puts "Cart Content"
    (0..@cart.compact.length-1).each \
      {|x| puts "#{x+1}) #{@cart.compact[x][:name].name} \t \
      #{@cart.compact[x][:name].cost}  \t \
      #{@cart.compact[x][:quantity]}"} 
    puts "1) Store Front"
    puts "2) Checkout"
    case gets.to_i 
    when 1
      store_front
    
    when 2
      checkout
      
    end
  end
  def checkout
    
  end
end

class FoodItem #This is something that can be bought
  attr_accessor :name, :cost
  def initialize(name,cost)
    @name = name
    @cost = cost.to_f
  end
end
