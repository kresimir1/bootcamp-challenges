require 'pg'
require 'faker'
require 'pry'

TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

#WRITE CODE TO SEED YOUR DATABASE AND TABLES HERE
def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

TITLES.each do |name|
  db_connection do |conn|
    sql = %(
      INSERT INTO recipes (recipe_name)
      VALUES ($1)
    )
    conn.exec_params(sql, [name])
  end
end

comments_data = []

35.times do
  comments_data << Faker::Lorem.sentence
end


comments_data.each do |comment|
  db_connection do |conn|
    name = TITLES.sample
    id = TITLES.index(name) + 1
    sql = %(
    INSERT INTO comments (comment, recipe_name, recipe_id) VALUES ($1, $2, $3)
    )
    conn.exec_params(sql, [Faker::Lorem.sentence, name, id])
  end
end
#How many recipes are there in total?
#How many comments are there in total?

db_connection do |conn|
  @recipe_count = db_connection {|conn| conn.exec("SELECT count(recipe_name) FROM recipes")}
  @comment_count = db_connection {|conn| conn.exec("SELECT count(comment) FROM comments")}
end
puts "Total number of recipes is: #{@recipe_count[0]["count"].to_i}"
puts "Total number of comments is: #{@comment_count[0]["count"].to_i}"

#How would you find out how many comments each of the recipes have?
@recipe_comments_count = {}
TITLES.each do |name|
  db_connection do |conn|
    @count = db_connection {|conn| conn.exec("SELECT count(recipe_name) FROM comments WHERE recipe_name = '#{name}'")}
  end
  @recipe_comments_count[name] = @count[0]["count"].to_i
end

@recipe_comments_count.each do |name, count|
  puts "#{name} : #{count}"
end
#What is the name of the recipe that is associated with a specific comment?
db_connection do |conn|
  @specific_name = db_connection {|conn| conn.exec("SELECT recipe_name FROM comments WHERE comment ='#{"Ex ipsam quo sint quia et."}'")}
end
puts "Recipe name with the comment(Ex ipsam quo sint quia et) is '#{@specific_name[0]["recipe_name"]}'"

#Add a new recipe titled Brussels Sprouts with Goat Cheese. Add two comments to it.
2.times do
  db_connection do |conn|
    name = "Brussels Sprouts with Goat Cheese"
    id = TITLES.length + 1
    sql = %(
    INSERT INTO comments (comment, recipe_name, recipe_id) VALUES ($1, $2, $3)
    )
    conn.exec_params(sql, [Faker::Lorem.sentence, name, id])
  end
end
