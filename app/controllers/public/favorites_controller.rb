class Public::FavoritesController < ApplicationController

  def create
    park = Park.find(params[:park_id])
    favorite = current_customer.favorites.new(park_id: park.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    park = Park.find(params[:park_id])
    favorite = current_customer.favorites.find_by(park_id: park.id)
    favorite.destroy
    redirect_to request.referer
  end

end
