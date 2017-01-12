require_relative 'student'

class SystemCheckSubmission
#  include Grade

  attr_reader :solution, :student
  attr_reader :grade
  def initialize(solution, student)
    @student = student
    @solution = solution
    @grade = grade
  end

  def assign_grade(grade)
    if !grade.nil? && grade < 0
      raise InvalidGradeError
    else
      @grade = grade
      return @grade
    end
  end

  def graded?
    if grade.nil?
      false
    else
      true
    end
  end



end


class InvalidGradeError < StandardError
end
