

items_we_have = "chips popcorn skittles clif-bar mentos gum cheetos m&ms"

puts "What item would you like?"
item = gets.chomp
item_index = items_we_have.index(item.downcase)
if item_index.nil?
  puts "I am sorry, we don't have that item"
else
  puts "Item index:"
  puts item_index
end
