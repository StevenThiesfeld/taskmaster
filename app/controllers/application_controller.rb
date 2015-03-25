class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login, :set_project_tasks
  
  private
  
  def require_login
    if session[:user_id]
      @user = User.find(session[:user_id])
      @project = Project.find_by_id(session[:project_id]) if session[:project_id]
    else
      redirect_to "/login"
    end
  end
  
  def set_project_tasks
    if @project
      @open_tasks = @project.tasks.where(status: "open").order(:row_order)
      @closed_tasks = @project.tasks.where(status: "closed").order('updated_at DESC')
    end
  end
  
end
