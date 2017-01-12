require_relative 'deck'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    # Your code here after writing tests
    # Think about what this method needs to do
    cards_sum = 0
    card_values = []
    @cards.each do |card|
      a = card.slice!(0)
      if a == "A"
        card_values << 11
      elsif a.to_i >= 2 && a.to_i <= 9
        card_values << a.to_i
      else
        card_values << 10
      end
    end
    card_values.each do |value|
      cards_sum += value
    end
    if cards_sum > 21 && card_values.include?(11)
      cards_sum -= 10
    end
    cards_sum
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
# hand.calculate_hand # Get this working properly
