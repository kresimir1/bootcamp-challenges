class Search < ApplicationRecord

  def search_cars
    cars = Car.all
    manufacturers = Manufacturer.all

    cars =  cars.where(["model LIKE ?", "%#{keywords}%"]) if keywords.present?
    cars =  cars.where(["color LIKE?", color]) if color.present?

    manufacturer = manufacturers.where(["name LIKE ?", manufacturer_name]) if manufacturer_name.present?
    cars = cars.where("manufacturer_id =?", manufacturer[0].id) if manufacturer_name.present?
    cars =  cars.where(["year =?", year]) if year.present?

    if [1000, 10000, 100000].include? max_milage
      cars =  cars.where(["milage <=?", max_milage])
    end

    return cars
  end
end
