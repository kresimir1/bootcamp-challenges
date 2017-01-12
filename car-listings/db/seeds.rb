# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
manufacturer_attributes =
  [{ name: 'Honda', country: 'Japan'},
    { name: 'Mazda', country: 'Japan'},
    { name: 'Ford', country: 'USA'},
    { name: 'Mercedes', country: 'Germany'},
    { name: 'BMW', country: 'Germany'},
    { name: 'Tesla', country: 'USA'}
  ]

manufacturer_attributes.each do |attributes|
 manufacturer= Manufacturer.new(attributes)
 manufacturer.save
end

car_attributes =
 [{ model: 'Honda Civic', manufacturer_id: 1, color: 'red', year: '1995', milage: '350000', description: 'Description 1'},
   { model: 'Mazda3', manufacturer_id: 2, color: 'blue', year: '2003', milage: '210000', description: 'Description 2'},
   { model: 'Fiesta', manufacturer_id: 3, color: 'green', year: '2010', milage: '156000', description: 'Description 3'},
   { model: 'S-Class', manufacturer_id: 4, color: 'yellow', year: '2015', milage: '10123', description: 'Descripton 4'},
   { model: '7 series', manufacturer_id: 5, color: 'white', year: '2016', milage: '1900', description: 'Description 5'},
   { model: 'Model X', manufacturer_id: 6, color: 'black', year: '2016', milage: '900', description: 'Description 6'},
   { model: 'Accord', manufacturer_id: 1, color: 'black', year: '2011', milage: '45000', description: 'Description 7'}
  ]

 car_attributes.each do |attributes|
  car = Car.new(attributes)
  car.save
end
