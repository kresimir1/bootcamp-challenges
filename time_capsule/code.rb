puts "Hello and welcome!!! What is your name?"
name = gets.chomp


time_capsule = []
while true
  print "What would you like to add to the time capsule? (type FINISHED when you're done) \n >"
  items = gets.chomp
  if items.downcase == "finished"
    break
  else
    puts "How many would you like?"
    quantity = gets.chomp
    items += " (#{quantity})"
    time_capsule << items
  end
end

puts
if time_capsule ==[]
  puts "#{name}, your time capsule is empty!!"
else
  puts "#{name}, thanks for trying our Time Capsule maker. Here is a list of the items in your Time Capsule!:
  "
  time_capsule.each do |item|
  puts "* #{item} "
  end
end
