class Admin::ParkCommentsController < ApplicationController

  def destroy
    @comment = ParkComment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントの削除に成功しました"
    redirect_to request.referer
  end

end
