class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :like]

  layout = "discussions"

  def index
    
    # @new_projects = Project.limit(3).order(created_at: :desc)
    @new_projects = Project.newest.limit_3
    @projects = Project.by_hit.all_but(@new_projects.collect(&:id))
    @favourite_projects = Project.by_likes.limit_3
  end

  def show

    @project.hit_count += 1
    @project.save
  end

  def edit

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    redirect_to project_url
  end

  def project_params
    params.require(:project).permit(:title, :body)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def like

    session[:project_ids] ||= []

    if session[:project_ids].include? params[:id].to_i
      redirect_to @project, alert: "Liked already"
    else
      session[:project_ids] << @project.id
      @project.like_counter += 1
      @project.save
      redirect_to @project, notice: "T. Hanks for liking!"
    
    end
    
  end

  def favorites

  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
