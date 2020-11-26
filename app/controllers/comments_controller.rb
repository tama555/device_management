class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/tasks/#{comment.task.id}"
  end
  
  def destroy
    comment = Comment.find_by(id: params[:id],task_id: params[:task_id]).destroy
    redirect_to "/tasks/#{comment.task.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, task_id: params[:task_id])
  end

end
