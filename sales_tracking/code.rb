# Your code, here.
puts "Enter your values here!"
total = 0.0

while total < 100
  print "> "
  value = gets.chomp.to_f
  total = total + value
end

puts "You've reached 100!"
