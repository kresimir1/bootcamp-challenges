require "spec_helper"

RSpec.describe Player do
  # Player specs go here.
  let(:player) {Player.new("Bart Simpson", "Catcher", "Simpson Slammers")}
  describe ".new" do
    it "should have an instance method name" do
      expect(player.name).to eq("Bart Simpson")
    end
    it "should have an instance method position" do
      expect(player.position).to eq("Catcher")
    end
    it "should have an instance method team_name" do
      expect(player.team_name).to eq("Simpson Slammers")
    end
  end

  describe ".all" do
    it "should return an array of Player objects that correspond to every player" do
      expect(player.all[0].name).to eq("Bart Simpson")
      expect(player.all[1].name).to eq("Homer Simpson")
    end

  end
end
