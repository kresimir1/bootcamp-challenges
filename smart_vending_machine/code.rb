puts "What would you like today?"
item = gets.chomp
puts "How many of those would you like?"
quantity = gets.chomp

if quantity.index("tons").nil?
  quantity.to_i.times do
    puts item
  end
else
  while
  number = rand(15)
  puts item
    if number == 0
      break
    end
  end
end

puts "There you go! Come again!"
