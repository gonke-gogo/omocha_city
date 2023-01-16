class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to post_path(comment.post), success: 'コメントしました'
    else
      redirect_to post_path(comment.post), warning: 'コメントできませんでした'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    respond_to do |format|
      format.html { redirect_to request.referer, warning: "コメントを削除しました", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(post_id: params[:post_id])
  end
end
