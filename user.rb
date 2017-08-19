class User #This is a person going to the store
    attr_accessor :name, :wallet_amt, :inventory
    def initialize(name, wallet_amt)
      @name = name
      @wallet_amt = wallet_amt.to_f
      @inventory = []
    end
    def sell_item(item)
      @wallet_amt = wallet_amt - item.cost
      @cart.push(item.name)
    end
  end