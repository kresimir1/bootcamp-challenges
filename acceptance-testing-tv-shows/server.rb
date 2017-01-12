require 'sinatra'
require 'csv'
require_relative "app/models/television_show"

set :views, File.join(File.dirname(__FILE__), "app/views")


get "/television_shows" do
  @shows = []
  CSV.foreach('television-shows.csv', headers: true, header_converters: :symbol) do |file|
      @shows << file
  end
  erb :index

end


get "/television_shows/new" do

  erb :new
end

post "/television_shows/new" do
  title = params[:title]
  network = params[:network]
  starting_year = params[:starting_year]
  synopsis = params[:synopsis]
  genre = params[:genre]
  data = [title, network, starting_year, synopsis, genre]
  @titles = []
  CSV.foreach('television-shows.csv', headers:true, header_converters: :symbol) do |row|
    @titles << row[:title]
  end
    if @titles.include?(params[:title])
      @error =  "The show has already been added"
      erb :new
    elsif params[:title].empty? || params[:network].empty? ||
      params[:starting_year].empty? || params[:synopsis].empty? || params[:genre].empty?
      @message = "Please fill in all required fields"
      erb :new
    else
      CSV.open("television-shows.csv", "a") do |file|
          file.puts(data)
          redirect "/television_shows"
      end
    end

end
