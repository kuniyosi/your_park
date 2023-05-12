class Public::ParkCommentsController < ApplicationController

  def create
    @park = Park.find(params[:park_id])
    @comment = current_customer.park_comments.new(park_comment_params)
    @comment.park_id = @park.id
    @comment.save
    @park_comment = ParkComment.new
  end

  def destroy
    @comment = ParkComment.find(params[:id])
    @comment.destroy
  end

  private

  def park_comment_params
    params.require(:park_comment).permit(:comment)
  end

end

