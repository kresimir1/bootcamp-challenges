# Part 1
# class Student
#   attr_reader :first_name, :last_name, :grades
#
#   def initialize(first_name, last_name, grades)
#     @first_name = first_name
#     @last_name = last_name
#     @grades = grades
#   end
# end

#Part 2 and 3

class Student
  attr_reader :first_name, :last_name, :grades

  def initialize(student_info)
    @first_name = student_info[:first_name]
    @last_name = student_info[:last_name]
    @grades = student_info[:grades]
    @average = average
  end

  def average
    sum = 0.0
    @grades.each do |grade|
      sum += grade
    end
    sum / grades.length
  end
  require 'pry'
  binding pry
end

#Part 3
