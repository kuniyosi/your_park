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
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
       redirect_to admin_park_path(@park)
    else
      render edit
    end
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    redirect_to admin_parks_path
  end

  private

  def park_params
    params.require(:park).permit(:name, :image, :introduction)
  end

end
