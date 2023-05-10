class Admin::ParkCommentsController < ApplicationController
  
  def destroy
    ParkComment.find(params[:id]).destroy
    redirect_to admin_park_path(params[:park_id])
  end
  
end
