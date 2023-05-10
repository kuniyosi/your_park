class Public::ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
    @park_comment = ParkComment.new
  end

  def index
    @parks = Park.all
  end
  
  def search_park
    @park = Park.new
    @parks = Park.search(params[:keyword])
  end
end
