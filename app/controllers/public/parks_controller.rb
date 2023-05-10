class Public::ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
    @park_comment = ParkComment.new
  end

  def index
    @parks = Park.all
  end
end
