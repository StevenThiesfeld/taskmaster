class TasksController < ApplicationController
  
  def new
    @task = @project.tasks.build
  end
  
  def create
    @task = @project.tasks.build(params[:task])
    @task.task_number = @open_tasks.length + @closed_tasks.length + 1
    if @task.save
      @open_tasks.unshift(@task)
    else
      render "new"
    end
  end
  
  def update_row_ordering
    @open_tasks.each do |task|
      task.row_ordering = params["#{task.task_number}"]
      task.save!
    end

      render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
    end
  
  def destroy
    @task = Task.find(params[:id])
    if @task.status == "open"
      @task.status = "closed"
    else 
      @task.status = "open"
    end
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
