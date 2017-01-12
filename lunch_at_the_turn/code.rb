
menu = {"Hamburger" => 4.00, "Hot Dog" => 3.00, "Fries" => 2.00,
"Chips" => 1.00, "Water" => 1.25, "Soda" => 1.50}

not_valid = nil
meals = []
while not_valid.nil? || !not_valid.empty?
  puts "Welcome to Goodburger, home of the Goodburger! Can I take your order?
"
  order = gets.chomp.capitalize
  meals = order.split(",")

  not_valid = meals - menu.keys

  if !not_valid.empty?
    not_valid.each do |item|
      puts "Sorry! We don't have '#{item}' on the menu."
    end
  end
end

total = 0
meals.each do |meal|
  total += menu[meal]
end

puts "Thanks! Your total is $ #{total}. Have a nice day!"
