
class CookieInventory
  attr_accessor :cookies, :peanut_butter, :chocolate_chip, :sugar

  def initialize
    @cookies = {peanut_butter: 0, chocolate_chip: 0, sugar: 0}
    end

  def cook_batch!(cookie_type, num_baked)
    @cookies[cookie_type] += num_baked
  end

  def sell!(cookie_type, num_ordered)
    if @cookies[cookie_type] > num_ordered
      @cookies[cookie_type] -= num_ordered
    else
      puts "Sold out"
    end
  end
end

inventory = CookieInventory.new{}
puts inventory.inspect
# test cook_batch!
inventory.cook_batch!(:peanut_butter, 10)
inventory.cook_batch!(:chocolate_chip, 10)
inventory.cook_batch!(:sugar, 10)
puts inventory.inspect
# test sell!
inventory.sell!(:peanut_butter, 5)
puts inventory.inspect
# Test "Sold out"
puts inventory.sell!(:chocolate_chip, 20)
