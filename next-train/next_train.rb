# YOUR CODE HERE
train_times = [2, 5, 7.5, 8.5, 9, 10, 11.5, 13.5, 14.5, 17, 18, 19, 24]
puts "What time do you want to leave the office?(military time)"
time = gets.chomp.to_f
i = 0

available_trains = train_times.select { |a| a > time }
train_number = train_times.index(available_trains[0]) + 1

puts "You should catch train #{train_number} leaving at #{available_trains[0]}!"
puts

if train_number == 13
  puts "***DON'T STOP...BELIEVIN'!***"
  puts "Just a small town girl
Living in a lonely world
She took the midnight train going anywhere
Just a city boy
Born and raised in South Detroit
He took the midnight train going anywhere

A singer in a smoky room
A smell of wine and cheap perfume
For a smile they can share the night
It goes on and on and on and on

Strangers waiting, up and down the boulevard
Their shadows searching in the night
Streetlights people, living just to find emotion
Hiding, somewhere in the night."
end
