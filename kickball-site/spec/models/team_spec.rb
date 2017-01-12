require "spec_helper"

RSpec.describe Team do
  # Team specs go here.
  let(:team) {Team.new("Simpson Slammers")}
  describe ".new" do
    it "should have an instance method name" do
      expect(team.name).to eq("Simpson Slammers")
    end
  end

  describe ".all" do
    it "should return an array of Team objects " do
      expect(team.all[0].name).to eq("Simpson Slammers")
      expect(team.all[-1].name).to eq("Griffin Goats")
    end
  end

  describe ".players" do
    it "should return an array of Player objects playing for a certain team " do
      expect(team.players("Simpson Slammers")[0].name).to eq("Bart Simpson")
    end
    it "should return an array of Player objects playing for a certain team " do
      expect(team.players("Simpson Slammers")[0].position).to eq("Catcher")
    end
    it "should return an array of Player objects playing for a certain team " do
      expect(team.players("Simpson Slammers")[0].team_name).to eq("Simpson Slammers")
    end

    it "should return an array of Player objects playing for a certain team " do
      expect(team.players("Griffin Goats")[3].name).to eq("Stewie Griffin")
    end

  end
end
