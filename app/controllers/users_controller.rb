class UsersController < ApplicationController
  
  skip_before_filter :require_login, only: [:new, :create]
  
  
  def show
    session[:project_id] = nil
  end
  
  def new
    @user = User.new
    render layout: "login"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/profile"
    else
      render "new", layout: "login"
    end
  end
  
end
