require 'spec_helper'

RSpec.describe Leaderboard do
  describe ".new" do
  # YOUR CODE GOES HERE
  end
  let (:board) {Leaderboard.new()}
  describe "#games" do
    it "has an method game - an array with games info" do
      expect(board.games).to be_a(Array)
    end
    it "contains 5 element - games" do
      expect(board.games.count).to eq(5)
    end
  end

  describe "#teams" do
    it "should be an array containing Team object for every team name" do
      expect(board.teams).to be_a(Array)
    end
    it "should have four different Team objects" do
      expect((board.teams).count).to eq(4)
    end
    it "should contain team names in order of appearance" do
      expect(((board.teams)[0]).name).to eq("Patriots")
    end
  end

  describe "#winners" do
    it "should create an array of winners" do
      expect((board.winners)[0]).to eq("Patriots")
    end
    it "should have 5 winners" do
      expect((board.winners).count).to eq(5)
    end
  end

  describe "#losers" do
    it "should create an array of losers" do
      expect((board.losers)[0]).to eq("Broncos")
    end
  end

  describe "#add_result" do
    it "should add the total number of wins for each team to objects in array" do
      board.teams
      board.winners
      expect(board.add_result[0].wins).to eq(3)
    end
    it "should add the total number of losses for each team to objects in array" do
      board.teams
      board.losers
      expect(board.add_result[3].losses).to eq(1)
    end
  end
  describe "#ranking" do
    it "should sort the teams array by number of wins and losses" do
      board.teams
      board.winners
      board.losers
      board.add_result
      expect((board.ranking[0]).name).to eq("Patriots")
      expect((board.ranking[3]).name).to eq("Colts")
    end
  end

  describe "#summary" do
    it "prints the summary of all the results in
    table with margins and a title line if categories" do
      board.teams
      board.winners
      board.losers
      board.add_result
      board.ranking
      expect(board.summary).to include("---------------------------------------------------")
      expect(board.summary).to include("Name       Rank      Total Wins    Total Losses")
      expect(board.summary).to include("Steelers   2          1             1")

    end
  end
end
