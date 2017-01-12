class CampersController < ApplicationController

  def index
    @title = "All Campers:"
    @campers = Camper.all
    unless params[:campsite_id].nil?
      @campsite = Campsite.find(params[:campsite_id])
      @campers = @campsite.campers
    end
  end


  def show
    @camper = Camper.find(params[:id])
  end
end
