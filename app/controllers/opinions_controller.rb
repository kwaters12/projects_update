class OpinionsController < ApplicationController
  def create
    @opinion = Opinion.new comment_attributes
    @discussion = Discussion.find params[:discussion_id]
    @opinion.discussion = @discussion
    if @opinion.save
      redirect_to @discussion, notice: "Thanks for your opinion!"
    else
      render "projects/show"
    end
  end

  def comment_attributes
    params.require(:opinion).permit(:body)
  end
end
