class Container
  attr_reader :weight, :maximum_holding_weight
  attr_accessor :ingredients
  def initialize(weight, maximum_holding_weight)
    @weight = weight
    @maximum_holding_weight = maximum_holding_weight
    @ingredients = []
  end

  def fill_with_ingredient(ingredient)
    @weight += @maximum_holding_weight
    @ingredients << ingredient
    max_num = (maximum_holding_weight / @ingredients[0].weight).round
    while @ingredients.count < max_num
      @ingredients << ingredient
    end
  end

  def which_ingredient
    @ingredients[0].name
  end

  def how_many_ingredients
    @ingredients.count
  end

  def remove_one_ingredient
    @ingredients.delete_at(0)
  end

  def empty
    @ingredients = []

  end

end
