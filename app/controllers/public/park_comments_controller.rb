class Public::ParkCommentsController < ApplicationController

  def create
    park = Park.find(params[:park_id])
    comment = current_customer.park_comments.new(park_comment_params)
    comment.park_id = park.id
    comment.save
    redirect_to park_path(park)
  end

  def destroy
    ParkComment.find(params[:id]).destroy
    redirect_to park_path(params[:park_id])
  end

  private

  def park_comment_params
    params.require(:park_comment).permit(:comment)
  end

end
