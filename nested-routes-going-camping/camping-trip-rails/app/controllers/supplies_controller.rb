class SuppliesController < ApplicationController
  def index
    @title = "All Supplies:"
    @supplies = Supply.all
    unless params[:camper_id].nil?
      @camper = Camper.find(params[:camper_id])
      @supplies = @camper.supplies
    end
  end
end
