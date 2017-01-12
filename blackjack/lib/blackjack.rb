require_relative "deck"
require_relative "hand"
require_relative "card"


deck = Deck.new
player_cards = deck.deal(1)
computer_cards = deck.deal(1)
player = Hand.new(player_cards)
computer = Hand.new(computer_cards)
#Your code here...
"Player was dealt: #{player_cards[-1].rank}#{player_cards[-1].suit}"

puts "Welcome to Blackjack!\n"
puts "Player was dealt: #{player_cards[-1].rank}#{player_cards[-1].suit}"

player_input = "h"

while player_input.downcase == "h"
  player_cards << (deck.deal(1))[0]
  puts "Player was dealt: #{player_cards[-1].rank}#{player_cards[-1].suit}"
  puts "\nPlayer score: #{player.calculate_hand}"
  if player.calculate_hand > 21
    puts "\nBust! You lose..."
    break
  end
  puts
  puts "Hit or stand (H/S):"
  player_input = gets.chomp
    if player_input.downcase == "s"
      puts "Player score: #{player.calculate_hand}"
      puts
      puts "Dealer was dealt: #{computer_cards[-1].rank}#{computer_cards[-1].suit}"
      while computer.calculate_hand < 17
        computer_cards << (deck.deal(1))[0]
        puts "Dealer was dealt: #{computer_cards[-1].rank}#{computer_cards[-1].suit}"
        puts "\nDealer score: #{computer.calculate_hand}\n"
      end
        if computer.calculate_hand < 21
          puts "\nDealer stands."
        end
      break
    else
      until player_input.downcase == "s" || player_input.downcase == "h"
      puts "Invalid input. Please choose a valid option 'H' or 'S'!"
      player_input = gets.chomp
      end
    end
end

if computer.calculate_hand > 21
  puts "\nComputer bust. You win!!!"
elsif player.calculate_hand <= 21 && player.calculate_hand > computer.calculate_hand
  puts "\nYou win!!!"
elsif computer.calculate_hand > player.calculate_hand
  puts "\nComputer wins!!!"
elsif computer.calculate_hand == player.calculate_hand
  puts "\nIt's a draw!!!"
end
