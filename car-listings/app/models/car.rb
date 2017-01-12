class Car < ActiveRecord::Base

  belongs_to :manufacturer


  validates :model, presence: true
  validates :manufacturer_id, presence: true
  validates :color, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1920, message: "Year can't be under 1920" }

  validates :milage, presence: true, numericality: { only_integer: true}

  def self.search(search)
    if search
      where(["model LIKE ?", "%#{search}%"])
    else
      all
    end
  end

  def condition(year, milage)
    if year == 2016 && milage < 1000
      "Excellent"
    elsif year >= 2015 && milage < 50000
      "Good"
    elsif year <= 2011 && milage >= 50000
      "Poor"
    else
      "Fair"
    end
  end
end
