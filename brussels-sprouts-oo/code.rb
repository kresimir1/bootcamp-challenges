#YOUR CODE GOES HERE
class Ingredient
  attr_accessor :quantity, :unit, :name

  def initialize(quantity = 0.0, unit = nil, name = nil)
    @quantity = quantity
    @unit = unit
    @name = name
  end

  def summary
    "#{@quantity} #{unit} #{@name}"
  end
end

class Recipe
  attr_accessor :name, :instructions, :ingredients
  def initialize(name = nil, instructions = [], ingredients = [])
    @name = name
    @instructions = instructions
    @ingredients = ingredients

  end

  def recipe_summary
    puts @name
    puts
    puts "Ingredients"
    @ingredients.each do |ingredient|
      puts ingredient.summary
    end
    puts
    puts "Instructions"
    @instructions.each_with_index do |instruction, index|
      puts "#{index + 1}. #{instruction}"
    end

  end

end

ingredients_test = [
    Ingredient.new(2, " ", "EGGS"),
    Ingredient.new(2.0, "tbspn(s)", "Water"),
    Ingredient.new(1/8, "tspn(s)", "Kosher salt"),
    Ingredient.new("Dash", " ", "Pepper"),
    Ingredient.new(1, "tspn(s)", "Butter"),
    Ingredient.new(1/3, "cup(s)", "filling, such as shredded cheese, finely chopped ham")
]


instructions_test = [
  "BEAT eggs, water, salt and pepper in small bowl until blended.",
  "HEAT butter in 6 to 8-inch nonstick omelet pan or skillet over medium-high heat until hot. TILT pan to coat bottom. POUR IN egg mixture. Mixture should set immediately at edges.",
  "GENTLY PUSH cooked portions from edges toward the center with inverted turner so that uncooked eggs can reach the hot pan surface. CONTINUE cooking, tilting pan and gently moving cooked portions as needed.",
  "When top surface of eggs is thickened and no visible liquid egg remains, PLACE filling on one side of the omelet. FOLD omelet in half with turner. With a quick flip of the wrist, turn pan and INVERT or SLIDE omelet onto plate. SERVE immediately."
]

recipe_test = Recipe.new("BASIC FRENCH OMELET", instructions_test, ingredients_test)

recipe_test.recipe_summary
