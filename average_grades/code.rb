
def average(grades)
  sum = 0
  grades.each do |grade|
    sum += grade.to_f
  end
  return sum/grades.size
end

jane = [98,95,88,97,74]
samantha = [85,93,98,88,49]
matt = [87,93,89,97,65]

def letter_grade(average)
  case
  when average >= 90
    return "A"
  when average >= 80
    return "B"
  when average >= 70
    return "C"
  when average >= 60
    return "C"
  else
    return "F"
  end
end

puts letter_grade(average(matt))

def rankings(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student}"
  end
end
students_list = ["Johhny", "Jane", "Sally", "Elizabeth", "Michael"]

rankings(students_list)
