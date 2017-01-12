require_relative "system_check_submission"
require_relative "student"
require_relative 'lesson'
class SystemCheck < Lesson
#  include Grade
  attr_reader :name, :due_date
  attr_reader :submissions
  def initialize(name, due_date)
    @name = name
    @due_date = due_date
    @submissions = []
  end

  def add_submission(submission)
  @submissions << submission
  @submissions
  end

  def average_grade
    sum = 0
      @submissions.each do |submission|
        sum += submission.grade.to_f
      end
    sum / @submissions.size
  end

  def did_student_complete_system_check?(student_name)
    if @submissions.empty?
      return false
    else
      @submissions.each do |submission|
        if !submission.nil? && submission.student.name.to_s == student_name.name
          return true
        end
      end

    end
  end

  def submittable?
    true
  end

end
