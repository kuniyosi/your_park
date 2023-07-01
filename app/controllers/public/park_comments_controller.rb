class Public::ParkCommentsController < ApplicationController

  def create
    @park = Park.find(params[:park_id])
    @comment = current_customer.park_comments.new(park_comment_params)
    @comment.park_id = @park.id
    if @comment.save
       flash[:notice] = "コメントを投稿しました"
       redirect_to request.referer
    else
       flash[:notice] = "コメントの投稿に失敗しました"
       redirect_to request.referer
    end
  end

  def destroy
    @comment = ParkComment.find(params[:id])
    # @comment.customer.id == current_customer.idを入れて他会員が削除できないようにする
    if @comment.customer.id == current_customer.id
       @comment.destroy
       flash[:notice] = "コメントを削除しました"
       redirect_to request.referer
    else
       flash[:notice] = "コメントの削除に失敗しました"
       redirect_to request.referer
    end
  end

  private

  def park_comment_params
    params.require(:park_comment).permit(:comment, :star)
  end

end
