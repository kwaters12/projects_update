class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:flag, :show, :edit, :update, :like]
  
  def index
    @discussions = Discussion.recent
  end

  def show
    @opinion = Opinion.new
    @discussion.hit_count += 1
    @discussion.save
  end

  def edit
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.save
    redirect_to discussions_path
  end

  def update
    @discussion = Discussion.find(params[:id])
    @discussion.update_attributes(discussion_params)
    redirect_to discussion_url
  end

  def discussion_params
    params.require(:discussion).permit(:title, :body)
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy
    redirect_to discussions_path
  end

  def like

    session[:discussion_ids] ||= []

    if session[:discussion_ids].include? params[:id].to_i
      redirect_to @discussion, alert: "Liked already"
    else
      session[:discussion_ids] << @discussion.id
      @discussion.like_counter += 1
      @discussion.save
      redirect_to @discussion, notice: "T. Hanks for liking!"
    
    end
    
  end

  # Build a custom action for discussions controller 
  # with “post” called “flag” and requires an id to be 
  # passed
  def flag
    @discussion = Discussion.find(params[:id])
    @discussion.save
  end

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

end
