class Public::ParksController < ApplicationController
  before_action :authenticate_customer!

  def show
    @park = Park.find(params[:id])
    @park_comment = ParkComment.new
    @park_comments = @park.park_comments.page(params[:page])
  end

  def index
    @parks = Park.page(params[:page])
    if params[:tag_ids]
       @parks = []
       params[:tag_ids].each do |key, value|
         @parks += Tag.find_by(name: key).parks if value == "1"
       end
       @parks.uniq!
       @parks = Kaminari.paginate_array(@parks).page(params[:page]).per(5)
    end
  end

  def search_park
    @parks = Park.search(params[:keyword])
    @parks = @parks.page(params[:page])
  end

 private

  def park_params
    params.require(:park).permit(tag_ids: [])
  end
end
