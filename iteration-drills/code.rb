#Write Ruby<->English answers here as comments in your code
# RUby -> English
# 1. will multiple each element "number" in the array "numbers" by 3
# 2. will put out the length (number of charactes) for each element "name" of the array "names"
# 3. will iterate through each element "number" in the array "numbers" and add it to the
#    variable "sum" so in the end it puts out the sum of all of the elements in the array
# 4. will iterate through the given hash "hash" and print out every key "name" and its value "age"
# 5. will calculate and print out the sum of all the values ("value") in the hash "account"
# 6. will iterate through hash "adresses" and print out each key "name" and value "adress"

# English -> Ruby
# 1. For every element 'word' in the array 'sentences' print out the word.
#    sentences.each do |word|
#      puts word
#    end

# 2. For every element 'phone_number' in the array 'numbers' print out the phone
#    number if it is a MA area code.

#ma_area_codes = [339, 351, 413, 508, 617, 774, 781, 857, 978]
#numbers.each do |phone_number|
#  ma_area_codes.each do |code|
#  if phone_number.to_s.include?code.to_s
#    puts phone_number
#  end
#  end
#end

# 3.For every element number in the array 'numbers' print out every odd number.
# numbers.each do |number|
# 	if number % 2 != 0
# 		puts number
#     end
# end

# 4. For every name-age pair in the hash 'ages', print out each pair.
# ages.each do |name, age|
#   puts "#{name} is #{age} years old."
# end
# 5. For every name-age pair in the hash 'ages', print out a pair if the age is > 10.
# ages.each do |name, age|
# 	if age > 10
# 		puts "Older than 10 are: #{name} : #{age}"
#     end
# end

# 6. For every name-age pair in the hash 'ages', print out a pair if the age is even.
# ages.each do |name, age|
# 	if age % 2 == 0
# 		puts "Pairs with even ages are: #{name} : #{age}"
#     end
# end

array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# Write Ruby code to find out the answers to the following questions:

# * What is the sum of all the numbers in `array`?
sum = 0
array.each do |number|
  sum += number
end
puts "The sum of all the numbers in the array is: #{sum}!"
# * How would you print out each value of the array?
array.each do |number|
  puts number
end
# * What is the sum of all of the even numbers?
# * What is the sum of all of the odd numbers?
sum_even = 0
sum_odd = 0
array.each do |number|
  if number % 2 == 0
    sum_even += number
  else
    sum_odd += number
  end
end
puts "The sum of all the even numbers in the array is: #{sum_even}"
puts "The sum of all the odd numbers in the array is: #{sum_odd}"

# * What is the sum of all the numbers divisble by 5?
sum_div_5 = 0
array.each do |number|
  if number % 5 == 0
    sum_div_5 += number
  end
end
puts "The sum of all the numbers divisible by five is: #{sum_div_5}"
# * What is the sum of the squares of all the numbers in the array?
sum_square = 0
array.each do |number|
	sum_square += number * number
end
puts "The sum of all the squares of all the numbers is: #{sum_square}"

array = ["joanie", "annamarie", "muriel", "drew", "reva", "belle", "amari", "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo", "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]

# Write Ruby code to find out the answers to the following questions:

# * How would you print out each name backwards in `array`?
array. each do |name|
  puts name
end
# * What are the total number of characters in the names in `array`?
total = 0
array.each do |name|
  total += name.length
end
puts "The total number of characters in the names in the array is: #{total}"
# * How many names in `array` are less than 5 characters long?
count_short_names = 0
array.each do |name|
  if name.length < 5
    count_short_names += 1
  end
end
puts "There are #{count_short_names} names that are shorter than 5 characters"
# * How many names in `array` end in a vowel?
count_names_vowel = 0
vowels = ["a", "e", "i", "o", "u"]
array.each do |name|
  vowels.each do |vowel|
  if name[-1].include?vowel.to_s
      count_names_vowel += 1
  end
  end
end
puts "There are #{count_names_vowel} names that end in a vowel"
# * How many names in `array` are more than 5 characters long?
count_long_names = 0
array.each do |name|
  if name.length > 5
    count_long_names += 1
  end
end
puts "There are #{count_long_names} names that are longer than 5 characters"
# * How many names in `array` are exactly 5 characters in length?
count_names_5 = 0
array.each do |name|
  if name.length == 5
    count_names_5 += 1
  end
end
puts "There are #{count_names_5} names that are 5 characters long"

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

#  Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of the artists?
best_records.each do |artist, record|
  puts "#{artist} : #{record}"
end
# * How would you print out all the names of the albums?
puts "Names of the albums:"
best_records.each do |artist, record|
  puts record
end

# * Which artist has the longest name?
longest_name = ""
best_records.each do |artist, record|
  if artist.length > longest_name.length
    longest_name = artist
  end
end
puts "The longest name is #{longest_name}"
# * How would you change all the album titles for every artist to `Greatest Hits`?
best_records.each do |artist, record|
  best_records[artist] = "Greatest Hits"
end

# * How would you delete a key-value pair if the artist's name ends in a vowel?
vowels = ["a", "e", "i", "o", "u"]
best_records.each do |artist, record|
  vowels.each do |vowel|
  if artist[-1].include?vowel.to_s
    best_records.delete(artist)
  end
  end
end

ages = {"Arch"=>89, "Gretchen"=>93, "Simone"=>12, "Daija"=>96, "Alivia"=>22, "Serena"=>28, "Alek"=>3, "Lula"=>24, "Christian"=>62, "Darryl"=>47, "Otha"=>32, "Evalyn"=>44, "Lincoln"=>27, "Rebeca"=>99, "Beatrice"=>99, "Kelton"=>10, "Zachary"=>18, "Aurelie"=>91, "Dell"=>71, "Lisandro"=>22}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `ages`?
ages.each do |name, age|
  puts name
end
# * How would you print out each key-value pair in the format of `<name> is <age> years old.`?
ages.each do |name, age|
  puts " #{name} is #{age} years old."
end
# * How would you print out every person with odd numbered age?
puts "People with odd numbered age:"
ages.each do |name, age|
  if age % 2 != 0
    puts "#{name} : #{age}"
  end
end
# * How would you delete everyone under 25 years of age?
ages.each do |name, age|
  if age < 25
    ages.delete(name)
  end
end

# * What is the name and age of everyone with a name greater than or equal to 5 characters?
puts "Name and age of everyone with a name greater than or equal to 5 characters:"
ages.each do |name, age|
  if name.length >= 5
    puts "#{name} : #{age}"
  end
end


people =
{
  "Alia O'Conner PhD" => {
         "phone" => "538.741.1841",
       "company" => "Leuschke-Stiedemann",
      "children" => [
          "Simone",
          "Cindy",
          "Jess"
      ]
  },
           "Ike Haag" => {
         "phone" => "(661) 663-8352",
       "company" => "Carter Inc",
      "children" => [
          "Joe",
          "Ofelia",
          "Deron"
      ]
  },
       "Brian Heller" => {
         "phone" => "1-288-601-5886",
       "company" => "O'Conner Group",
      "children" => [
          "Renee"
      ]
  },
       "Maryse Johns" => {
         "phone" => "218-571-8774",
       "company" => "Kuhlman Group",
      "children" => [
          "Dominick",
          "Tricia"
      ]
  },
  "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
      "company" => "Heidenreich, Nietzsche and Dickinson"
  }
}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `people`?
people.each do |name, info|
	puts name
end

# * How would you print out all the names of `people` and which company they work for?
people.each do |name, info|
	puts name + info["company"]
end
# * What are the names of all the children of everyone in `people`?
puts "Names of the children"
people.each do |name, info|
  puts info["children"]
end
# * What are the names of all the companies that people work for?
puts "Names of all the companies:"
people.each do |name, info|
	puts info["company"]
end
# * How would you convert all the phone numbers to the same standard (pick one)?

people.each do |name, info|
  info["phone"].to_s.gsub!(/[-.()]/, " ")
end

people =
[
    {
          "Derek Wehner" => {
               "phone" => "588-047-7782",
             "company" => "Daniel-Carroll",
            "children" => [
                "Phoebe",
                "Gretchen",
                "Wiley"
            ]
        },
           "Ali Koelpin" => {
               "phone" => "1-127-057-0020",
             "company" => "Rau, Rutherford and Lockman",
            "children" => [
                "Juwan"
            ]
        },
        "Ervin Prohaska" => {
               "phone" => "(393) 630-3354",
             "company" => "Carter Inc",
            "children" => [
                "Virgil",
                "Piper",
                "Josianne"
            ]
        },
          "Hellen Borer" => {
              "phone" => "1-687-825-0947",
            "company" => "Maggio, Ferry and Moen"
        }
    },
    {
        "Elinor Johnson" => {
              "phone" => "819.911.5553",
            "company" => "Pollich Group"
        }
    },
    {
        "Richmond Murray" => {
               "phone" => "1-516-432-2364",
             "company" => "Sporer and Sons",
            "children" => [
                "Kade",
                "Sage"
            ]
        },
            "Nakia Ferry" => {
               "phone" => "134-079-2237",
             "company" => "Hamill, O'Keefe and Lehner",
            "children" => [
                "Rollin"
            ]
        }
    }
]

# Write Ruby code to find out the answers to the following questions:

# * What are the names of everyone in `people`?
puts "All the names in people:"
people.each do |name|
	puts name.keys
end
# * What are the names of all the children in `people`?
puts "The names of the children:"
people.each do |name|
	name.each do |sub_name, info|
  if !info["children"].nil?
  puts info["children"]
  end
  end
end
# * How would you create a new hash called `phone_numbers` that has a key of a name and value of a phone number in `people`?
phone_numbers = {}
people.each do |name|
	name.each do |sub_name, info|
	phone_numbers[sub_name] = info["phone"]
  end
end
puts phone_numbers.inspect
# * How would you create a new hash called `employers` that has a key of a name and a value of a company name in `people`?
employers = {}
people.each do |name|
	name.each do |sub_name, info|
	employers[sub_name] = info["company"]
  end
end
puts employers.inspect
# * How would you create a new hash called `children_count` that has a key of a name and a value of the number of children a person has?
children_names = {}
children_count = {}
people.each do |name|
	name.each do |sub_name, info|
	children_names[sub_name] = info["children"]
    end
end

children_names.each do |name, children|
  if !children.nil?
	  children_count[name] = children.length
  else
    children_count[name] = 0
  end
end
puts children_count.inspect
