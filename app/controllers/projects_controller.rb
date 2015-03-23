class ProjectsController < ApplicationController
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      render "show"
    else
      render "new"
    end
  end
  
end