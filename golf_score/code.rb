golf_score = [
  { par: 5, score: 7 },
  { par: 4, score: 5 },
  { par: 3, score: 3 },
  { par: 4, score: 4 },
  { par: 4, score: 4 },
  { par: 3, score: 2 },
  { par: 4, score: 5 },
  { par: 5, score: 5 },
  { par: 4, score: 5 },
  { par: 5, score: 7 },
  { par: 4, score: 4 },
  { par: 4, score: 4 },
  { par: 3, score: 3 },
  { par: 4, score: 5 },
  { par: 4, score: 5 },
  { par: 4, score: 4 },
  { par: 3, score: 3 },
  { par: 5, score: 6 }
]

total_par = 0
total_strokes = 0

golf_score.each do |score|
   total_par +=score[:par]
   total_strokes += score[:score]
end

puts "Total Strokes: #{total_strokes}"
puts "Total Par: #{total_par}"

result = total_strokes - total_par

if result >= 0
  puts "You were #{result} over par."
else
  puts "You were #{result * (-1)} under par."
end
