
def greet(name, language = nil)
  case
  when language == "Spanish"
    random_greeting = "Hola"
  when language == "Italian"
    random_greeting = "Ciao"
  when language == "French"
    random_greeting = "Bonjor"
  else
    random_greeting = ["Hi", "Yo", "Hey", "Howdy"].sample
  end
  puts "#{random_greeting} #{name}!!"

end

greet("Kreso")
