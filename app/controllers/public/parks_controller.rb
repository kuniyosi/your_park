class Public::ParksController < ApplicationController

  def new
    @park = Park.new
    if params[:tag]
      Tag.create(name: params[:tag])
    end
  end

  def create
    @park = Park.new(park_params)
    if @park.save
       redirect_to parks_path
    else
       render new_park_path
    end
  end

  def show
    @park = Park.find(params[:id])
    @park_comment = ParkComment.new
  end

  def index
    @parks = Park.all
    if params[:tag_ids]
      @parks = []
      params[:tag_ids].each do |key, value|
        @parks += Tag.find_by(name: key).parks if value == "1"
      end
      @parks.uniq!
    end
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
       redirect_to park_path(@park)
    else
      render edit
    end
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    redirect_to parks_path
  end

  def search_park

    @parks = Park.search(params[:keyword])
  end

 private

  def park_params
    params.require(:park).permit(:name, :image, :introduction, :address, :area, tag_ids: [])
  end
end
