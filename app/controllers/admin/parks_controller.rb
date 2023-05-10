class Admin::ParksController < ApplicationController

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    if @park.save
       redirect_to admin_parks_path
    else
       render new_admin_park_path
    end
  end
  
  def show
    @park = Park.find(params[:id])
  end
  
  def index
    @parks = Park.all
  end

  def edit
  end

  def destroy
  end

  private

  def park_params
    params.require(:park).permit(:name, :image, :introduction)
  end

end
