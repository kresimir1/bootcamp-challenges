# YOUR CODE GOES HERE
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

  def self.parse(input)
    [@quantity = input.split(" ")[0],
    @unit = input.split(" ")[1],
    @name = input.split(" ")[2]]
  end
end

class Recipe
  attr_accessor :name, :instructions, :ingredients, :invalid_ingredients
  def initialize(name = nil, instructions = [], ingredients = [])
    @name = name
    @instructions = instructions
    @ingredients = ingredients
    @invalid_ingredients = ["Brussels_sprouts", "spinach", "eggs", "milk",
      "tofu", "seitan", "bell_peppers", "quinoa", "kale", "chocolate", "beer", "wine", "whiskey"]
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

  def ingredients_validation
    answer = true
    @ingredients.each do |ingredient|
      if @invalid_ingredients.include?(ingredient.name.to_s)
        answer = false
      end
    end
    answer
  end

end

# Test 1 - with not safe ingredients
ingredients_test = [
    Ingredient.new(2, " ", "eggs"),
    Ingredient.new(2.0, "tbspn(s)", "water"),
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


recipe_test.ingredients_validation
puts "Is #{recipe_test.name} safe? #{recipe_test.ingredients_validation}"


# test 2
safe_name = "Tomato salad"
safe_ingredients = [
        Ingredient.new(5, "pieces", "tomatoes"),
        Ingredient.new(1.0, "cup", "olive_oil")
      ]
safe_instructions = [
        "Cut tomatoes in small pieces.",
        "Pour oil over tomatoes.",
        "Enjoy your life."
      ]
safe_recipe = Recipe.new(safe_name, safe_instructions, safe_ingredients)
puts "Is #{safe_recipe.name} safe? #{safe_recipe.ingredients_validation}"

# test 3 parse
avocado = Ingredient.parse("2 piece avocado")
puts avocado.inspect
