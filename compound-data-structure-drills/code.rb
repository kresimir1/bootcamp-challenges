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
          "Domenick",
          "Trycia"
      ]
  },
  "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
      "company" => "Heidenreich, Nitzsche and Dickinson"
  }
}
# Write Ruby code to find out the answers to the following questions:

# * How many people are in `people` (excluding children)?

people_count = 0
people.each do |person, info|
  people_count += 1
end
puts "There are #{people_count} people in the 'people'"
# or we can just do:
puts "Different way: \nThere are #{people.size} people in the 'people'"
# * What are the names of all the people?
puts "The names of the people:"
people.each do |person, info|
  puts person
end
# * What is the phone number of Alia O'Conner PhD?
puts "Alia O'Conner PhD phone number is #{people["Alia O'Conner PhD"]["phone"]}"
# * How many children does Brian Heller have?
puts "Brian Heller has #{people["Brian Heller"]["children"].size} child"
# * What company does Dr. Adela DuBuque work for?
puts "Dr. Adela DuBuque works for #{people["Dr. Adela DuBuque"]["company"]}."
# * What are the names of the people who have children?
"People who have children"
people.each do |person, data|
  if !data["children"].nil?
    puts person
  else
    # * What are the names of the people who do not have children?
    puts "#{person} does not have children."
  end
end
# * What is Brian Heller's child's name?
puts "Brian Heller's child's name is #{people["Brian Heller"]["children"][0]}."
# * What is Maryse Johns' first child's name?
puts "Maryse Johns' first child's nameis #{people["Maryse Johns"]["children"][0]}."

# * Dr. Adela DuBuque just had a baby named Tomas. How would you update the hash for this information?
people["Dr. Adela DuBuque"]["children"] = "Tomas"


sets_of_people =
[
  {
         "Bernard Feil" => {
             "phone" => "(880) 434-0630",
           "company" => "Maggio Inc",
          "children" => [
              "Nikki"
          ]
      },
          "Ruby Hessel" => {
             "phone" => "1-467-852-4981",
           "company" => "Kemmer Inc",
          "children" => [
              "Sydney"
          ]
      },
          "Savanah Toy" => {
             "phone" => "440-632-0287",
           "company" => "Hudson, Stehr and Lind",
          "children" => [
              "Garth"
          ]
      },
      "Casandra Kemmer" => {
            "phone" => "1-515-759-7470",
          "company" => "Davis, Bernier and Hermann"
      },
             "Edd Rath" => {
            "phone" => "(522) 829-3164",
          "company" => "Mosciski LLC"
      }
  },
  {
         "Dagmar Brakus" => {
             "phone" => "1-881-313-1173",
           "company" => "Mitchell, Schmitt and Haley",
          "children" => [
              "Reuben"
          ]
      },
         "Einar Effertz" => {
            "phone" => "(265) 857-5141",
          "company" => "Pfeffer, Klocko and Von"
      },
      "Dr. Sigrid Nader" => {
             "phone" => "707.762.7870",
           "company" => "Weissnat, Hayes and Dickinson",
          "children" => [
              "Israel",
              "Elyse",
              "Wilfredo"
          ]
      }
  }
]

# Write Ruby code to find out the answers to the following questions:
puts "\n Part 2 \n *********************SETS OF PEOPLE*****************"
# * How many people are in the first set of people?
puts "There are #{sets_of_people[0].size} people in the first set."
# * How many people are in the second set of people?
puts "There are #{sets_of_people[1].size} people in the second set."

# * What is Ruby Hessel's phone number?
puts "Ruby Hessel's phone number is #{sets_of_people[0]["Ruby Hessel"]["phone"]}"
# * What are the names of Dr. Sigrid Nader's children?
puts "The names of Dr. Sigrid Nader's children are: "
sets_of_people[1]["Dr. Sigrid Nader"]["children"].each do |child|
  puts child
end
# * What is Bernard Feil's child's name?
puts "Bernard Feil's child's name is #{sets_of_people[0]["Bernard Feil"]["children"][0]}"
# * What company does Casandra Kemmer work for?
puts "Casandra Kemmer works for #{sets_of_people[0]["Casandra Kemmer"]["company"]} "
# * Who are all the people in the first set that have an `m` in their Company names?
puts "People in the first set who have an 'm' in their company name"
sets_of_people[0].each do |name, info|
  if info["company"].include?("m")
    puts name
  end
end
