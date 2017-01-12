require_relative "../spec/spec_helper"

class Leaderboard
GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

# YOUR CODE GOES HERE
  attr_reader :games,:teams, :winners
  #  attr_reader :teams
    def initialize
      @games = []
      @teams = []
      @winners = []
      @losers = []
      GAME_INFO.each do |game|
        @games << game
      end
    end


    def teams
      @games.each do |game|
        @teams << Team.new(game[:home_team])
        @teams << Team.new(game[:away_team])
      end
      @teams.uniq! do |team|
        team.name
      end
      @teams
    end

    def winners
      @games.each do |game|
        if game[:home_score] > game[:away_score]
          @winners << game[:home_team]
        else
          @winners << game[:away_team]
        end
      end
      @winners
    end

    def losers
      @games.each do |game|
        if game[:home_score] < game[:away_score]
          @losers << game[:home_team]
        else
          @losers << game[:away_team]
        end
      end
      @losers
    end

    def add_result
      @teams.each do |team|
        @winners.each do |winner|
          if winner == team.name
            team.wins += 1
          end
        end
        @losers.each do |loser|
          if loser == team.name
            team.losses += 1
          end
        end
      end
      @teams
    end

    def ranking
      @teams.sort_by {|team| team.wins}.reverse!
      @teams.sort_by! {|team| team.losses}
      @teams.each_with_index do |team, index|
        team.rank = index + 1
      end
    end

    def summary
      result =  " ---------------------------------------------------\n"
      result += "|  Name       Rank      Total Wins    Total Losses |\n"
      result += "|  #{(@teams[0]).name}   #{@teams[0].rank}          #{@teams[0].wins}             #{@teams[0].losses}           |\n"
      result += "|  #{(@teams[1]).name}   #{@teams[1].rank}          #{@teams[1].wins}             #{@teams[1].losses}           |\n"
      result += "|  #{(@teams[2]).name}    #{@teams[2].rank}          #{@teams[2].wins}             #{@teams[2].losses}           |\n"
      result += "|  #{(@teams[3]).name}      #{@teams[3].rank}          #{@teams[3].wins}             #{@teams[3].losses}           |\n"
      result +=  " ---------------------------------------------------\n"

    end
end
