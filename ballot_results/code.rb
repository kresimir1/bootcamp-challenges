vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

#list out vote results
vote_results.each_with_index do |precinct_results, precinct_index|
  puts "**In precinct #{precinct_index + 1}:**"

  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end

  puts ""
end
# How many people voted in precinct 1?
sum = 0
vote_results[0].each do |result|
  sum += result
end
puts "#{sum} people voted in precinct 1"

# Who was the winning candidate in Precinct 4?
count = -1
vote_index = -1
vote_results[3].each_with_index do |result, index|
  if result > count
    count = result
    vote_index = index
  end
end
puts "The winner in Precinct 4 is #{candidates[vote_index]}"

# How many people voted for Mary Sue?
# How many people voted for Billy Joe?
# How many people voted for Sally Jane?

candidates.each_with_index do |candidate, candidate_index|
  candidate_votes = 0
  vote_results.each_with_index do |precinct_results, precinct_index|
    if candidate == candidates[candidate_index]
      candidate_votes += vote_results[precinct_index][candidate_index]
    end
  end
  puts "#{candidate_votes} people voted for #{candidates[candidate_index]}"
end

# How many people voted in total?
total_sum = 0
vote_results.each do |precinct|
  precinct.each do |result|
    total_sum += result
  end
end
puts "#{total_sum} people voted in total"

# Who had the most votes?
candidate_result = 0
winner_index = 0
candidates.each_with_index do |candidate, candidate_index|
  candidate_votes = 0
  vote_results.each_with_index do |precinct_results, precinct_index|
    if candidate == candidates[candidate_index]
      candidate_votes += vote_results[precinct_index][candidate_index]
    end
  end
  if candidate_votes > candidate_result
    candidate_result = candidate_votes
    winner_index = candidate_index
  end
end
puts "#{candidates[winner_index]} had the most votes: #{candidate_result}"
