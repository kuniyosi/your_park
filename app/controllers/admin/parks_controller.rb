class Admin::ParksController < ApplicationController
  before_action :authenticate_admin_admin!

  def new
    @park = Park.new
    if params[:tag]
      if Tag.create(name: params[:tag])
         redirect_to admin_parks_path
      else
         render admin_parks_path
      end
    end
  end

  def create
    @park = Park.new(park_params)
    if @park.save
       flash[:notice] = "投稿に成功しました"
       redirect_to admin_parks_path
    else
       flash[:notice] = "投稿に失敗しました"
       render new_admin_park_path
    end
  end

  def show
    @park = Park.find(params[:id])
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


  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
       flash[:notice] = "編集に成功しました"
       redirect_to admin_park_path(@park)
    else
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @park = Park.find(params[:id])
    if @park.destroy
       flash[:notice] = "投稿を削除しました"
       redirect_to admin_parks_path
    else
       flash[:notice] = "削除に失敗しました"
       redirect_to admin_park_path(@park)
    end
  end

  def search_park
    @parks = Park.search(params[:keyword])
    @parks = @parks.page(params[:page])
  end

  private

  def park_params
    params.require(:park).permit(:name, :image, :introduction, :address, :area, tag_ids: [])
  end

end
