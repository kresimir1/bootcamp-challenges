# A program to help you build quotes for clients
  width = 8
  lenght = 20
  hight_in = 8
  hight_ft = hight_in.to_f / 12
  cube = width * lenght * hight_ft
  # I followed th instructions on the given pricing chart and added
  # the round method for edge cases like between 49 and 50
  if cube.round <= 49
	  price = 20
  elsif cube.round >= 50 && cube.round <= 149
	  price = 50
  elsif cube.round >= 150 && cube.round <= 299
	  price = 100
  else
    price = 150
  end

  puts "Cubic Feet: #{cube} "
  puts "Quote price: $#{price}"
