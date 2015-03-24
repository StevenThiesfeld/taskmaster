class ProjectsController < ApplicationController
  
  def show
    @project = Project.find(params[:id])
    session[:project_id] = @project.id
    set_project_tasks
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to project_path(@project)
    else
      render "new"
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to "/profile"
    else
      render "edit"
    end
  end
  
end
