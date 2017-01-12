class SearchesController < ApplicationController

  def new
    @search = Search.new
    @manufacturers = Manufacturer.distinct.pluck(:name)
    @colors = Car.distinct.pluck(:color)
    @years = Car.order(year: :desc).distinct.pluck(:year)
    @max_milage = ['N/A', 1000, 10000, 100000]
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :manufacturer_name, :color, :year, :max_milage)
  end


end
