# YOUR CODE GOES HERE

print "Choose rock (r), paper (p), or scissors (s): "
player = gets.chomp.downcase
if player == "r"
  puts "Player chose rock."
elsif player == "p"
  puts "Player chose paper."
else
  puts "Player chose scissors."
end

computer = rand(3)

if computer == 0
  computer = "r"
  puts "Computer chose rock."
elsif computer == 1
  computer = "p"
  puts "Computer chose paper."
else computer = "s"
  puts "Computer chose scissors."
end

if player == computer
  puts "Tie!"
elsif player == "r" && computer == "p"
  puts "Paper beats rock, computer wins!"
elsif player == "r" && computer == "s"
  puts "Rock beats scissors, player wins!"
elsif player == "p" && computer == "r"
  puts "Paper beats rock, player wins!"
elsif player == "p" && computer == "s"
  puts "Scissors beats paper, computer wins!"
elsif player == "s" && computer == "r"
  puts "Rock beats scissors, computer wins"
elsif player == "s" && computer == "p"
  puts "Scissors beats paper, player wins!"
else
  puts "Invalid entry! You can only choose (r), (p) or (s)!!!"
end
