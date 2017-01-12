require_relative "../lib/team_data"

class Player
  attr_reader :name, :position, :team_name, :all


  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
    @all = []

  end

  def all
    TeamData.to_h.each do |team_name, player|
      player.each do |position, name|
        @all << Player.new(name, position, team_name)
      end
    end
    return @all
  end
end
