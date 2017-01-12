#YOUR CODE GOES HERE
require 'pg'
require 'csv'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end


CSV.foreach('ingredients.csv') do |row|
  db_connection do |conn|
    ingredient = row[1]
    sql = %(
    INSERT INTO ingredients_list (ingredient_name) VALUES ($1)
    )
    conn.exec_params(sql, [ingredient])
  end
end

db_connection do |conn|
  @list = db_connection {|conn| conn.exec("SELECT id, ingredient_name FROM ingredients_list")}
end
@list.each do |ingredient|
  puts "#{ingredient["id"]}. #{ingredient["ingredient_name"]}"
end
