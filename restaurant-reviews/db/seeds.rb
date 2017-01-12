restaurant_attributes =
  [{ name: 'Restaurant 1', address: 'Adress 1', city: 'City 1', state: 'State 1', zip: '20901', description: 'Description 1'},
  { name: 'Restaurant 2', address: 'Adress 2', city: 'City 2', state: 'State 2', zip: '20902'},
  { name: 'Restaurant 3', address: 'Adress 3', city: 'City 3', state: 'State 3', zip: '20903', description: 'Description 3'},
  { name: 'Restaurant 4', address: 'Adress 4', city: 'City 4', state: 'State 4', zip: '20904'},
  { name: 'Restaurant 5', address: 'Adress 5', city: 'City 5', state: 'State 5', zip: '20905', description: 'Description 5'},
  { name: 'Restaurant 6', address: 'Adress 6', city: 'City 6', state: 'State 6', zip: '20906', description: 'Description 6'},
  { name: 'Restaurant 7', address: 'Adress 7', city: 'City 7', state: 'State 7', zip: '20907'},
  { name: 'Restaurant 8', address: 'Adress 8', city: 'City 8', state: 'State 8', zip: '20908', description: 'Description 8'},
  { name: 'Restaurant 9', address: 'Adress 9', city: 'City 9', state: 'State 9', zip: '20909', description: 'Description 9'},
  { name: 'Restaurant 10', address: 'Adress 10', city: 'City 10', state: 'State 10', zip: '20910', description: 'Description 10'}
   ]

    restaurant_attributes.each do |attributes|
     restaurant= Restaurant.new(attributes)
     restaurant.save
   end


Category.find_or_create_by!(name: "Thai")
Category.find_or_create_by!(name: "Italian")
Category.find_or_create_by!(name: "Chinese")
Category.find_or_create_by!(name: "Russian")
Category.find_or_create_by!(name: "Fine dining")
Category.find_or_create_by!(name: "Brasserie and bistro")
Category.find_or_create_by!(name: "Buffet and smörgåsbord")
Category.find_or_create_by!(name: "Fast food")

RestaurantCategory.find_or_create_by!(restaurant_id: 1, category_id: 1)
RestaurantCategory.find_or_create_by!(restaurant_id: 2, category_id: 4)
RestaurantCategory.find_or_create_by!(restaurant_id: 3, category_id: 2)
RestaurantCategory.find_or_create_by!(restaurant_id: 4, category_id: 4)
RestaurantCategory.find_or_create_by!(restaurant_id: 5, category_id: 1)
RestaurantCategory.find_or_create_by!(restaurant_id: 5, category_id: 1)
RestaurantCategory.find_or_create_by!(restaurant_id: 6, category_id: 4)
RestaurantCategory.find_or_create_by!(restaurant_id: 7, category_id: 2)
RestaurantCategory.find_or_create_by!(restaurant_id: 8, category_id: 4)
RestaurantCategory.find_or_create_by!(restaurant_id: 9, category_id: 6)
