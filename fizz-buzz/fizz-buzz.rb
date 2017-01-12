numbers = []

i = 0

while i < 100
  i +=1
  if (i % 3 == 0) && (i % 5 == 0)
  	numbers << "fizzbuzz"
  elsif i % 3 == 0
  	numbers << "fizz"
  elsif i % 5 == 0
    numbers << "buzz"
  else
    numbers << i
  end
end

puts numbers
