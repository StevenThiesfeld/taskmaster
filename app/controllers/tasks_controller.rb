class TasksController < ApplicationController
  
  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @project= Project.find(params[:project_id])
    @task = @project.tasks.build(params[:task])
    if @task.save
      respond_to do |format|
        format.js
      end
    else
      render "new"
    end
  end
  
  def edit
  end
  
  
end
