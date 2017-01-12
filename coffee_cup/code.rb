require 'pry'

class Coffee
  attr_accessor :amount, :capacity


  def initialize(amount = 8, capacity = 12)
    @amount = amount
    @capacity = capacity
  end

  def sip!(sip_amount)
    if @amount == sip_amount
      @amount = 0
      "Hey! You need a refill!"
    else
      @amount -= sip_amount
    end
  end

  def spill!
    @amount = 0
  end

  def refill!
    @amount = @capacity - 2
  end

  def cup_size
    if cup_size > 2
      @cup_size
    else
      "The maximum capacity of cups must be greater than 2"
    end
  end
  def to_s
    "There is #{@amount}oz of coffee left in your #{@capacity}oz cup."
  end
end

coffee = Coffee.new

#test
puts coffee.refill!
puts coffee.to_s
