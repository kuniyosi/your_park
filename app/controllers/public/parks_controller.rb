class Public::ParksController < ApplicationController
  before_action :authenticate_customer!

  def show
    @park = Park.find(params[:id])
    @park_comment = ParkComment.new
    @park_comments = @park.park_comments.page(params[:page])
  end

  def index
    if params[:latest]
     @parks = Park.latest
     @parks = @parks.page(params[:page])
    elsif params[:old]
     @parks = Park.old
     @parks = @parks.page(params[:page])
    else params[:favorite]
      parks = Park.includes(:favorited_customers).sort {|a,b| b.favorited_customers.size <=> a.favorited_customers.size}
      @parks = Kaminari.paginate_array(parks).page(params[:page]).per(5)
    end

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
    parks = Park.search(params[:keyword])
    @parks = parks.page(params[:page])
  end

  def search
    @keyword = params[:park][:search] if params[:park] # if paramsで再読み込みした場合のエラーを回避。全件データを表示する
    parks_all = Park.search(@keyword)
    @parks = Kaminari.paginate_array(parks_all).page(params[:page]).per(5)
  end

 private

  def park_params
    params.require(:park).permit(tag_ids: [])
  end
end
