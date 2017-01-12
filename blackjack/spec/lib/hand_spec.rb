require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new([Card.new(10, "♦"), Card.new("J", "♥")])}
  let(:hand1) { Hand.new([Card.new(7, "♦"), Card.new(4, "♥")])}
  let(:hand1a) { Hand.new([Card.new(9, "♦"), Card.new(7, "♥")])}
  let(:hand2) { Hand.new([Card.new("A", "♦"), Card.new("J", "♥")])}
  let(:hand3) { Hand.new([Card.new(7, "♦"), Card.new("J", "♥"), Card.new("A", "♥")])}
  let(:hand4) { Hand.new([Card.new(6, "♦"), Card.new("J", "♥"), Card.new(4, "♥"), Card.new("A", "♣")])}

  describe "#calculate_hand" do

    it "returns the sum value of two cards - face cards are valued 10" do
      expect(hand.calculate_hand).to eq(20)
    end

    it "returns the sum value of two cards - 2 to 9 are valued by their number" do
      expect(hand1.calculate_hand).to eq(11)
    end

    it "returns the sum value of two cards - 2 to 9 are valued by their number" do
      expect(hand1a.calculate_hand).to eq(16)
    end

    it "returns value of Ace 11 for total hand value 21 or less" do

      expect(hand2.calculate_hand).to eq(21)
    end

    it "returns value of Ace 1 if total value would exeed 21 for Ace 11" do
      expect(hand3.calculate_hand).to eq(18)
    end

    it "returns value of Ace 1 if total value would exeed 21 for Ace 11" do
      expect(hand4.calculate_hand).to eq(21)
    end


  end
end
