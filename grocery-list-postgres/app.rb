require "sinatra"
require "pg"
require 'pry'

configure :development do
  set :db_config, { dbname: "grocery_list_development" }
end

configure :test do
  set :db_config, { dbname: "grocery_list_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

FILENAME = "grocery_list.txt"

get "/" do
  redirect "/groceries"
end

get "/groceries" do
  @groceries = db_connection {|conn| conn.exec("
    SELECT name, id
    FROM groceries
    ORDER BY groceries.name")}
  erb :groceries
end

get "/groceries/:id" do
  @id = params[:id]
  @grocery_info = db_connection {|conn| conn.exec("
  SELECT groceries.name, groceries.id, comments.body
    FROM groceries
    LEFT OUTER JOIN comments ON (groceries.id = comments.grocery_id)
    WHERE groceries.id = '#{@id}'
  ")}
  @comments_info = db_connection {|conn| conn.exec("
  SELECT comments.body
  FROM comments
  WHERE comments.id = '#{@id}'
  ")}

  erb :comments

end

post "/groceries" do
  @name = [params["name"]]

  if params[:name].empty?
    redirect "/groceries"
  else
    db_connection do |conn|
      sql_query1 = "INSERT INTO groceries (name) VALUES ($1)"
      conn.exec_params(sql_query1, @name)
      redirect "/groceries"
    end
    erb :groceries
  end
end

delete "/groceries/:id" do
  @id = params[:id]
  db_connection {|conn| conn.exec("
  DELETE FROM groceries WHERE groceries.id =  '#{@id}'
  ")}
  db_connection {|conn| conn.exec("
  DELETE FROM comments
  WHERE comments.grocery_id IS NOT NULL
  AND comments.grocery_id =  '#{@id}'
  ")}
  redirect "/groceries"

  erb :groceries
end

get "/groceries/:id/edit" do
  @id = params[:id]
  @item = db_connection {|conn| conn.exec("
  SELECT groceries.name, groceries.id
    FROM groceries
    WHERE groceries.id = '#{@id}'
  ")}

  erb :edit
end

patch("/groceries/:id") do
  @id = params[:id]
  @name = params[:name]
  if params[:name].empty?


    redirect "/groceries/#{@id}/edit"
  else
    db_connection {|conn| conn.exec("
      UPDATE groceries
      SET name = '#{@name}'
      WHERE groceries.id = '#{@id}'
      ")}
    erb :groceries
    erb :edit
    redirect "/groceries"
  end
end
