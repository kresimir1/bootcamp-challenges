

voter_info = [{"First Name" => ["Jon", "Jane", "Sam", "Joan", "Sam", "Mark", "Susan", "Bill", "Doug", "Francis"]},
{"Last Name" => ["Smith", "Davies", "Farelly", "Favreau", "McNulty", "Minahan", "Umani", "Perault", "Stamper", "Underwood"]},
{"Age" => ["25", "30", "32", "35", "38", "48", "45", "24", "45", "52"]},
{"Income" => [50000, 60000, 80000, 65000, 63000, 78000, 75000, 45000, 75000, 100000]},
{"Household Size" => [1, 3, 2, 4, 3, 5, 2, 1, 1, 2]},
{"Gender" => ["Male", "Female", "Unspecified", "Female", "Male", "Male", "Female", "Male", "Male", "Male"]},
{"Education" => ["College" , "High School", "College", "College", "College", "High School",
  "College", "Did Not Complete High School", "College", "College"]}]

# Average age
# Average income
# Average Household size
average_categories = ["Age", "Income", "Household Size"]
voter_info.each do |categories|
  average_categories.each do |ave_cat|
    age_sum = 0
    if !categories[ave_cat].nil?
      categories[ave_cat].each do |value|
                age_sum += value.to_f
    end
    puts "The average #{ave_cat} is #{age_sum/(categories[ave_cat].size)}"
    end
  end
end

# Female Percentage
# Male Percentage
# Unspecified Gender Percentage
gender_type = ["Male", "Female", "Unspecified"]
voter_info.each do |categories|
  if !categories.nil?
  categories.each do |name, value|
    gender_type.each do |type|
    if name == "Gender"
      count = 0
      value.each do |gend|
        if gend == type
          count += 1
        end
      end
      puts "There are #{(count.to_f/value.size)*100}% voters of #{type} gender"
    end
    end
  end
  end
end

# Percent of those who obtained a college education level
# Percent of those who obtained a high school education level
# Percent of those that did not finish high school

education_types = ["High School", "College", "Did Not Complete High School"]
voter_info.each do |categories|
  if !categories.nil?
  categories.each do |name, value|
    education_types.each do |type|
    if name == "Education"
      count = 0
      value.each do |education|
        if education == type
          count += 1
        end
      end
      puts "There are #{(count.to_f/value.size)*100}% voters with #{type} education"

    end
    end
  end
  end
end
