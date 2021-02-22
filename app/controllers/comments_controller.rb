class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
    else

      @prototype = @comment.prototype
      @comments = @prototype.comments
      @ps = Prototype.find(params[:prototype_id])
      render  "prototypes/show"     # viewsフォルダ prototypes/show ファイル
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(prototype_id: params[:prototype_id], user_id: current_user.id )
  end
end
