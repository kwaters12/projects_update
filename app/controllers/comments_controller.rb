class CommentsController < ApplicationController
    before_action :set_project
    before_action :set_comment, only: [:destroy]
  def create
    @comment = Comment.new comment_attributes
    @project = Project.find params[:project_id]
    @comment.project = @project
    if @comment.save
      redirect_to @project, notice: "Thanks for your comment!"
    else
      render "projects/show"
    end
  end

  def comment_attributes
    params.require(:comment).permit(:body)
  end

  def destroy
    if @comment.destroy
      redirect_to @project, notice: "Answer deleted successfully"
    else
      flash.now[:alert] = "We couldn't delete the answer"
      render "projects/show"
    end
  end

  def set_comment
    @comment = @project.comments.find(params[:id])
  end

  def set_project
    @project = Project.find params[:project_id]
  end
end
