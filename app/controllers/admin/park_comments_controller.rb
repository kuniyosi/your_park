class Admin::ParkCommentsController < ApplicationController

  def destroy
    @comment = ParkComment.find(params[:id])
    @comment.destroy
  end

end
