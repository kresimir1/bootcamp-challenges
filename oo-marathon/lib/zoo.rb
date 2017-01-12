require_relative 'cage'
require_relative 'employee'
class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :name, :season_opening_date, :season_closing_date
  attr_reader :employees
  attr_reader :cages

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @employees = []
    @cages = [].tap do |cages|
      10.times do
        cages << Cage.new
      end
    end
  end




  def add_employee(name)
    @employees << name
    @employees
  end

  def open?(date)
    date > @season_opening_date &&
    date < @season_closing_date
  end

  def add_animal(animal)
    empty_cage = @cages.find{|cage| cage.empty?}
    if !empty_cage.nil?
      empty_cage.animal = animal
    else
      raise ZooAtCapacity
    end
  end

  def visit
    visit_describe = ''
    @employees.each do |employee|
      visit_describe += employee.greet + "\n"
    end
    @cages.each do |cage|
      unless cage.empty?
      visit_describe += cage.animal.speak + "\n"
      end
    end
    visit_describe

  end


end
