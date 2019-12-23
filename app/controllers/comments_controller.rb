class CommentsController < ApplicationController
	def create
    @memo = Memo.find(params[:memo_id])
    @comment = @memo.comments.new(comment_params)
    @memos = @comment.memo
    @comment.user_id = current_user.id
    if @comment.save!
      @memos.create_notification_comment!(current_user, @comment.id)
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'error'
      redirect_back(fallback_location: root_path)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
