require "sinatra"
require "JSON"
require_relative "models/player"
require_relative "models/team"
require_relative "lib/team_data"

get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get "/teams" do
  @teams = TeamData.to_h
  erb :layout
end

players_info1 = ""
teams = TeamData.to_h
teams.values[0].each do |position, player|
    players_info1 += "\n #{player}:  #{position}, "
end

get "/teams/Simpson%20Slammers" do
  players_info1
end

players_info2 = ""
teams = TeamData.to_h
teams.values[1].each do |position, player|
    players_info2 += "\n #{player}:  #{position}, "
end

get "/teams/Jetson%20Jets" do
  players_info2
end

players_info3 = ""
teams = TeamData.to_h
teams.values[2].each do |position, player|
    players_info3 += "\n #{player}:  #{position}, "
end

get "/teams/Flintstone%20Fire" do
  players_info3
end

players_info4 = ""
teams = TeamData.to_h
teams.values[3].each do |position, player|
    players_info4 += "\n #{player}:  #{position}, "
end

get "/teams/Griffin%20Goats" do
  players_info4
end
