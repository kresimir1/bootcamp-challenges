class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def show
     @manufacturer = Manufacturer.find(params[:id])
     @cars = @manufacturer.cars
  end

  def new
    @manufacturer = Manufacturer.new

  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

     if @manufacturer.save
       redirect_to manufacturers_path, notice: "Manufacturer added successfully"
     else
       render 'new'
     end
   end

   private
     def manufacturer_params
       params.require(:manufacturer).permit(:name, :country)
     end
end
