require 'sinatra'
require 'csv'

set :views, File.join(File.dirname(__FILE__), "views")

get "/" do
  redirect "/groceries"
end

get "/groceries" do
  @groceries = []
    CSV.foreach('grocery_list.csv', headers: true, header_converters: :symbol) do |file|
        @groceries << file
    end
  erb :index
end

get "/groceries/:grocery_name" do
  @grocery_name = params[:grocery_name]
  @groceries = []
    CSV.foreach('grocery_list.csv', headers: true, header_converters: :symbol) do |file|
        @groceries << file
    end


  erb :item
end

post "/groceries" do
  name = params[:name]
  quantity = params[:quantity]
  shopping_list = [name, quantity]
  @some_value = nil


    if params[:name].empty? && !params[:quantity].empty?
      @message = "Please enter the name of the grocery"
      @quantity = params[:quantity]
      erb :index

    elsif params[:name].empty?
      @message = "Please enter the name of the grocery"
      erb :index
    else
      CSV.open("grocery_list.csv", "a") do |file|
          file.puts(shopping_list)
          redirect "/groceries"
      end
    end

end
