# a programm that picks a random adventure

adventure = rand(3) + 1
if adventure == 1
  pick = "Sailing"
elsif adventure == 2
  pick = "Animal reservation"
else
  pick = "Jet skiing"
end
puts "#{pick} it is then!!!"
