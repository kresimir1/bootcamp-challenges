transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]
puts transactions.inspect
# Write Ruby code to find out the answers to the following questions:

# * What is the value of the first transaction?
puts "The value of the first transaction is: #{transactions.first}"
# * What is the value of the second transaction?
puts "The value of the second transaction is: #{transactions[1]}"
# * What is the value of the fourth transaction?
puts "The value of the fourth transaction is: #{transactions[3]}"
# * What is the value of the last transaction?
puts "The value of the last transaction is: #{transactions.last}"
# * What is the value of the second from last transaction?
puts "The value of the second from last transaction is: #{transactions[-2]}"
# * What is the value of the 5th from last transaction?
puts "The value of the 5th from last transaction is: #{transactions[-5]}"
# * What is the value of the transaction with index 5?
puts "The value of the transaction with index 5 is: #{transactions[5]}"
# * How many transactions are there in total?
puts "There are #{transactions.size} transactions in total."
# * How many positive transactions are there in total?
# * How many negative transactions are there in total?
positive_transactions = 0
negative_transactions = 0
transactions.each do |transaction|
  if transaction > 0
    positive_transactions += 1
  else
    negative_transactions += 1
  end
end
puts "There are #{positive_transactions} positive transactions in total."
puts "There are #{negative_transactions} negative transactions in total."
# * What is the largest withdrawal?
# Short way:
puts "The largest_withdrawal is #{transactions.sort[0]} "

# Longer way
largest_withdrawal = -1
largest_withdrawal_index = -1
transactions.each_with_index do |withdrawal, index|
  if withdrawal < largest_withdrawal
    largest_withdrawal = withdrawal
    largest_withdrawal_index = index
  end
end
puts "The largest_withdrawal is #{transactions[largest_withdrawal_index]}"
# * What is the largest deposit?
puts "The largest deposit is #{transactions.sort[-1]}"
# * What is the small withdrawal?
withdrawals = []
transactions.each do |transaction|
  if transaction < 0
    withdrawals << transaction
  end
end
puts "The smallest withdrawal is #{withdrawals.sort[-1]}"

# * What is the smallest deposit?
# Longer way
smallest_deposit = transactions.max
smallest_deposit_index = -1
transactions.each_with_index do |transaction, index|
  if transaction > 0
    if transaction < smallest_deposit
      smallest_deposit = transaction
      smallest_deposit_index = index
    end
  end
end
puts "The smallest deposit is #{transactions[smallest_deposit_index]}"
# * What is the total value of all the transactions?
total = 0
transactions.each do |transaction|
  total = transaction.abs + total
end
puts "The total value of all the transactions is #{total}"
# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?
balance = 239900
new_balance = balance + transactions[-1]
puts "The new value of balance is #{new_balance}"
puts "*******************************************"


best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

# Write Ruby code to find out the answers to the following questions:

# * How many records are in `best_records`?
puts "There are #{best_records.size} records in best_records"
# * Who are all the artists listed?
puts "The artists listed are:"
best_records.each do |artist, record|
  puts artist
end
# * What are all the album names in the hash?
puts "The album names are:"
best_records.each do |artist, record|
  puts record
end
# * Delete the `Eminem` key-value pair from the list.
best_records.delete("Eminem")
# * Add your favorite musician and their best album to the list.
best_records["THe Beatles"] = "St. Peppers Lonely Hearts Clubs Band"

# * Change `Nirvana`'s album to another.
best_records["Nirvana"] = "Grunge Is Dead"
# * Is `Nirvana` included in `best_records`?
# * Is `Soundgarden` included in `best_records`?
included_artist_check = ["Nirvana", "Soungarden"]
included_artist_check.each do |artist|
  if best_records.has_key?(artist)
    puts "#{artist} is included in best_records"
  else
    puts "#{artist} is not included in best_records"
  end
end
# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band.
best_records["Soundgarden"] = "Louder Than Love"
# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
puts "Pairs with keys that have less than 6 characters:"
best_records.each do |artist, record|
  if artist.length <= 6
    puts "#{artist} : #{record}"
  end
end

# * Which key-value pairs have a value that is greater than 10 characters?
puts "Pairs with values that have more than 10 characters:"
best_records.each do |artist, record|
  if record.length > 10
  puts "#{artist} : #{record}"
  end
end
