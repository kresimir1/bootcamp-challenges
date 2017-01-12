class Pizza
  attr_accessor :selection

  TOPPINGS = {
    cheese: 0.10,
    green_pepper: 0.30,
    onion: 0.50,
    mushroom: 0.70,
    pepperoni: 1.10,
    jalapeno: 1.30,
    sausage: 1.70,
    bacon: 1.90
  }

  def initialize(selection=[:cheese])
    @selection = selection
  end

  def cost
    cost = 8.00
    @selection.each do |topping|
      cost += TOPPINGS[topping]
    end
    cost
  end

  def meats
    # the & operator returns all the shared items between two arrays
    @selection & [:sausage, :pepperoni, :bacon]
  end

  def other_toppings
    @selection & [:cheese, :green_pepper, :onion, :mushroom, :jalepeno]
  end

  def self.toppings
    TOPPINGS.each do |topping, cost|
      formatted_topping_name = topping.to_s.gsub('_',' ')

      formatted_cost = '%.2f' % cost

      puts "#{formatted_topping_name} - $#{formatted_cost}"
    end
  end
end
