require "sinatra"
require "sinatra/activerecord"
require_relative "app/models/television_show"

set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app/views")

get "/" do
  redirect "/television_shows"
end

get "/television_shows" do
  @shows = TelevisionShow.all
  erb :index
end

get "/television_shows/new" do
  @show = TelevisionShow.new
  erb :new
end

get "/television_shows/:id" do
  @show = TelevisionShow.find(params[:id])
  if @show.ending_year.nil?
    @still_running = "Show is still running"
  end
  erb :show
end

post "/television_shows" do
  @show = TelevisionShow.new(params[:television_show])



  if @show.save
    redirect "/television_shows"
  else
    if @show.starting_year < 1900
      @error_message = "Please enter a valid starting year"
    elsif @show.ending_year < 1900
      @error_message = "Please enter a valid ending year"
    elsif @show.synopsis.length > 5000
      @error_message = "Synopsis must be under 5000 characters"
    end
    erb :new

  end
end
