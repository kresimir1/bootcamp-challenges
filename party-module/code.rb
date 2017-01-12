require_relative "personalized_havoc_error"
module PartyGoer
  #YOUR CODE GOES HERE

  def initialize
    @drink_num = 0
  end

  def drink
    drink_more = true
    if @drink_num >= 3
      drink_more = false
    end
    @drink_num += 1
    drink_more
  end

  def sing
    "Imagine"
  end

  def cause_havoc
    raise PersonalizedHavocError, "You should define this yourself!"
  end

  def invited?
    true
  end

end
