puts "Welcome to the Guessing Game! What difficulty would you like to play?"
puts "Type easy or hard: "
answer = gets.chomp
if answer == "easy"
  a = 10
else
  a = 20
end

number = rand(a)+1
puts " I've picked a number between 1 and #{a}. Now guess it!"
guess = gets.chomp
count = 1

while guess.to_i != number
  puts "Nope, try again!"
  count += 1
  guess = gets.chomp
end

puts "You win! Nice job!"
puts "Your score was: #{count}"
