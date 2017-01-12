class CarsController < ApplicationController

  def index
    @cars = Car.search(params[:search])

  end

  def show
     @car = Car.find(params[:id])
     @manufacturer = @car.manufacturer
  end

  def new
    @car = Car.new


  end


  def create
    @car = Car.new(car_params)
     if @car.save
       redirect_to cars_path, notice: "Car added successfully"
     else
       render 'new'
     end
   end

   private
     def car_params
       params.require(:car).permit(:model, :manufacturer_id, :color, :year, :milage, :description, manufacturer_ids:[])
     end
end
