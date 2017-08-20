#require_relative "shopping_script"
class Store #This is a place a shopper wants to go
attr_accessor :name, :inventory, :cart
  def initialize(name)
    @name = name
    @inventory = [
    {name: "Apples", cost: 0.50, quantity: 3},
    {name: "Banana", cost: 0.19, quantity: 3},
    {name: "Bread", cost: 1.99, quantity: 3},
    {name: "Cake", cost: 4.99, quantity: 3},
    {name: "Cereal", cost: 2.99, quantity: 3}]
    @cart = []
  end
  def store_front(user)
    puts "   Item\t\t    Price   \t Quantity"
    (0..@inventory.length-1).each \
    {|x| puts "#{x+1}) #{@inventory[x][:name]} \t \
    #{@inventory[x][:cost]}  \t \
    #{@inventory[x][:quantity]}"} 
    print "Enter item you would like to add to cart:"
    item_num = gets.to_i - 1
    puts "How many?"
    item_q = gets.to_i
    if item_q > @inventory[item_num][:quantity]
      puts "The store only has #{@inventory[item_num][:quantity]}"
      store_front
    elsif @cart.empty?
      @cart.push(@inventory[item_num].clone)
      cart_index = @cart.find_index(@inventory[item_num]).to_i
      @cart[cart_index][:quantity] = item_q
      @inventory[item_num][:quantity] = @inventory[item_num][:quantity]-item_q
    elsif @cart.any? { |hash_object| hash_object[:name] == @inventory[item_num][:name]}
      cart_index = @cart.find_index(@inventory[item_num]).to_i
      @cart[cart_index][:quantity] = @cart[cart_index][:quantity] + item_q
      @inventory[item_num][:quantity] = @inventory[item_num][:quantity]-item_q
    else
      @cart.push(@inventory[item_num].clone)
      @cart[@cart.length-1][:quantity] = item_q
      @inventory[item_num][:quantity] = @inventory[item_num][:quantity]-item_q
    end
    puts "#{item_q} #{@inventory[item_num][:name]} have been added to your cart"
    puts "Cart Content"
    (0..@cart.compact.length-1).each \
    {|x| puts "#{x+1}) #{@cart.compact[x][:name]} \t \
    #{@cart.compact[x][:cost]}  \t \
    #{@cart.compact[x][:quantity]}"} 
    sum = 0
    @cart.each { |index| sum += index[:cost]*index[:quantity]}
    puts "Cart Total $#{sum}"
    puts "Wallet Amount $#{user.wallet_amt}"
    puts "Options"
    puts "1) Store Front"
    puts "2) Checkout"
    if gets.to_i == 1
      store_front(user)
    end
  end
end