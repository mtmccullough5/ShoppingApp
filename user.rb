class User #This is a person going to the store
  attr_accessor :name, :wallet_amt, :inventory
  def initialize(name, wallet_amt)
    @name = name
    @wallet_amt = wallet_amt.to_f
    @inventory = []
  end
  def buy(cart, cart_cost)
    if @inventory.empty?
      @inventory = cart.clone
    else
      cart.each do |item|
        inventory.include? 
      end
      @cart.push(@inventory[item_num].clone)
      @cart[@cart.length-1][:quantity] = item_q
      @inventory[item_num][:quantity] = @inventory[item_num][:quantity]-item_q
    end
    @wallet_amt = @wallet_amt - cart_cost

  def sell_item(item)
    @wallet_amt = wallet_amt - item.cost
    @cart.push(item.name)
  end
end