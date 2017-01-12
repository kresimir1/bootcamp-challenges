

class Theater
  attr_accessor :capacity, :patrons
  def initialize(capacity, patrons = 0) #Part 1 - empty room
    @capacity = capacity
    @patrons = patrons
  end
# Part II: Admit One
  def admit!(patrons_admitted = 1)
    if (@patrons + patrons_admitted) > capacity
      "Error, the number of patrons exeeds capacity"
    else
      @patrons += patrons_admitted
    end
  end
# Part 3: at capacity
  def at_capacity?
    @patrons == @capacity
  end

  def record_walk_outs!(walk_outs = 0)
    @patrons -= walk_outs
  end

  def to_s
    "The capacity of the theater is #{@capacity}. At the moment there are #{@patrons} patrons."
  end
end

broadway = Theater.new(300)
# Test code
# Test - Part 1
puts broadway.to_s

# Test - Part 2
puts broadway.admit!(195)
puts broadway.admit!(135)
puts broadway.patrons
# Test - Part 3
puts broadway.at_capacity?
puts broadway.admit!(105)
puts broadway.at_capacity?
# Test - Part 4
puts broadway.record_walk_outs!(37)

puts broadway.to_s
