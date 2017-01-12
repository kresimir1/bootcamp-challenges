# YOUR CODE GOES HERE
player_score = 0
computer_score = 0
win_score = 2
while player_score < win_score && computer_score < win_score
  print "Choose rock (r), paper (p), or scissors (s): "
  player = gets.chomp.downcase
  if
	  if player == "r"
      player = "rock"
	  elsif player == "p"
  	  player = "paper"
	  elsif player == "s"
  	  player = "scissors"
	  end
	  puts "Player chose #{player}."

	  computer = rand(3)
	  if computer == 0
  	  computer = "rock"
  	elsif computer == 1
      computer = "paper"
 	  else computer = "scissors"
	  end
	  puts "Computer chose #{computer}."

	  case
	  when player == computer
  		  puts "Tie!"
	  when (player == "rock" && computer == "paper") ||
		  (player == "paper" && computer == "scissors") ||
  		(player == "scissors" && computer == "rock")
  		  puts "#{computer.capitalize} beats #{player}, computer wins the round!"
        computer_score +=1
    when (player == "rock" && computer == "scissors") ||
		  (player == "paper" && computer == "rock") ||
		  (player == "scissors" && computer == "paper")
  		  puts "#{player.capitalize} beats #{computer}, player wins the round!"
        player_score +=1
    end
  else
	  puts "Invalid entry! You can only choose (r), (p) or (s)!!!"
  end
  puts "\nPlayer Score: #{player_score}, Computer score: #{computer_score}"
end
puts
if computer_score == win_score
  puts "Computer wins!!!"
else puts "Player wins"
end
