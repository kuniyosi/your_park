class Public::FavoritesController < ApplicationController

  def create
    @park = Park.find(params[:park_id])
    @favorite = current_customer.favorites.new(park_id: @park.id)
    @favorite.save
  end

  def destroy
    @park = Park.find(params[:park_id])
    @favorite = current_customer.favorites.find_by(park_id: @park.id)
    @favorite.destroy
  end

end
