class Public::ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
  end

  def index
    @parks = Park.all
  end
end
