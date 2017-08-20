require_relative "shop"
require_relative "user"

class ShoppingApp # This will run everything
  attr_accessor :user, :store
  
  def initialize
    puts "Welcome New User!"
    puts "What is your name?"
    new_user_name = "Matthew" #gets.strip
    puts "Hello #{new_user_name} how much money would you like to add to your account?"
    new_user_wallet = 100 #gets.strip
    puts "You have added #{new_user_wallet} to your account."
    @user = User.new(new_user_name,new_user_wallet)
    @store = Store.new("Smiths")
  end
  
  def lets_go_shopping
    shopping = true
    while shopping
      puts "What would you like to do?"
      menu_options = [
        "Buy Items", 
        "Sell Items",
        "Check Wallet",
        "Quit"
      ]
      (0..menu_options.length-1).each {|x| puts "#{x+1}) #{menu_options[x]}"}
      case gets.to_i
      when 1 # Buy Items
        @store.store_front(@user) # Takes me to the store
      when 2 # Sell Items
        # Takes me to owned items
      when 3 # Check Wallet
        #Curren Wallet balance
      when 4 # Quit
        shopping = false
      end
    end
  end
  
  
  # def throw_list(list)
  #   
  # end
  # def throw_inventory(list)
  #   (0..store.inventory.length-1).each \
  #   {|x| puts "#{store.inventory[x].name} #{store.inventory[x].cost} "}
  # end
  # def lets_go_shopping
  #   #this will have the shopping loop to get items

    
  #   #main loop
  #   while true
  #     throw_list(menu_options)
  #     #Initiate Case
  #     selection = val_edit(gets,menu_options)
  #     case selection 
  #     when 1 #Buy Items
        
  #       puts puts "Welcome to #{store.name} we currently have the following:"
  #       throw_inventory(store.inventory)
  #       jake.buy_item(item)
  #       store.sell_item(item)
  #       puts "Enter New Item:"
  #       new_item = gets.strip
  #       list << new_item
  #       puts  "#{list[list.length-1]} entered!"
  #     when 2 #View Items
  #       puts "---Current List---"
  #       throw_list(list)
  #       gets
  #     when 5 #Search for an item
  #       puts "What do you want to search for?"
  #       looks = gets.strip
  #       if list.include?(looks)
  #         puts "Yes #{looks} is on the list"
  #       else
  #         puts "No dice!"
  #       end
  #         gets
  #     when 6 # Quit list
  #       break
  #     end
  #   end
  #   puts "All done!"
    
  # end
  
  # def self.buy_item
    
  # end
end

main = ShoppingApp.new()
main.lets_go_shopping

