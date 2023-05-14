class Public::ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
    @park_comment = ParkComment.new

    @comments = @park.park_comments.all
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

  def search_park
    @park = Park.new
    @parks = Park.search(params[:keyword])
  end

 private

  def park_params
    params.require(:park).permit(tag_ids: [])
  end
end
