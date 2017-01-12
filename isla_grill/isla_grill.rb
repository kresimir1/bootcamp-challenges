# Programm that calculates a random tip
dinner_total = 178
tip = [15, 18, 20, 25].sample
total_tip = (tip.to_f / 100) * dinner_total
puts "Your tip for #{tip}% should be $ #{total_tip}"
