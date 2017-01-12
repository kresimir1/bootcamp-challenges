require "spec_helper"

Rspec.describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new([Card.new(10, "♦"), Card.new ("J", "♥") }
  let(:hand1) { Hand.new(["7♦", "4♥"]) }
  let(:hand1a) { Hand.new(["9♦", "7♥"]) }
  let(:hand2) { Hand.new(["A♦", "J♥"]) }
  let(:hand3) { Hand.new(["7♦", "J♥", "A♥"]) }
  let(:hand4) { Hand.new(["6♦", "J♥", "4♥", "A♣"]) }
  # You can add more sample hands

  describe "#calculate_hand" do
    # We have included some example tests below. Change these once you get started!

    it "returns the sum value of two cards - face cards are valued 10" do
      # Use the RSpec keyword `expect`, as it appears below, to test your assertions
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

    # Add your remaining tests here.
    it "returns value of Ace 1 if total value would exeed 21 for Ace 11" do
      expect(hand3.calculate_hand).to eq(18)
    end

    it "returns value of Ace 1 if total value would exeed 21 for Ace 11" do
      expect(hand4.calculate_hand).to eq(21)
    end


  end
end
