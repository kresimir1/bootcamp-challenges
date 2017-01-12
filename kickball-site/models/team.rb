require_relative "../lib/team_data"
require_relative "player"
class Team
  attr_reader :name, :all, :players
  def initialize(name)
    @name = name
    @players = []
    @all = []
  end

  def all
    TeamData.to_h.each do |team_name, player|
      @all << Team.new(team_name)
    end
    return @all
  end

  def players(name)
    TeamData.to_h.each do |team_name, player|
      player.each do |position, player_name|
        if name == team_name
        @players << Player.new(player_name, position, team_name)
        end
      end
    end
    @players
  end

end
