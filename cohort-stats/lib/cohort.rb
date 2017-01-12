require_relative 'student'
require_relative 'system_check'
require_relative 'system_check_submission'

class Cohort
#  include Grade
  attr_reader :title, :start_date, :end_date
  attr_reader :students, :system_checks, :career_day
  def initialize(title, start_date, end_date)
    @title = title
    @start_date = start_date
    @end_date = end_date
    @students = []
    @system_checks = []
    @career_day = end_date + 4
  end

  def enroll(student)
    @students << student
    @students
  end

  def assign(system_check)
    @system_checks << system_check
    @system_checks
  end

  def roster
    cohort = "#{@title} \n"
    @students.each do |student|
      cohort << "#{student.name}: #{student.email}"
    end
    cohort
  end

  def system_check_completed?(system_check)
    if @system_checks[0].submissions.length == @students.size
      return true
    else
      return false
    end
  end



end
