require 'pry'

while true do
  puts "Can I get you anything?"
  answer = gets.chomp
  binding.pry
  if answer == "no"
    puts "Okay, bye!"
    break
  end
end
