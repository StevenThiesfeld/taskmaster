class TasksController < ApplicationController
  
  def new
    @task = @project.tasks.build
  end
  
  def create
    @task = @project.tasks.build(params[:task])
    if @task.save
    else
      render "new"
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.status = "closed"
    @task.save!
    render "update_project"
  end
  
  def edit
    @project = nil
    @task = Task.find(params[:id])
    render "new"
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      render "create"
    else
      render "new"
    end
  end
  
end
