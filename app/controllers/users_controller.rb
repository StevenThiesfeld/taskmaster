class UsersController < ApplicationController
  
  skip_before_filter :require_login, only: [:new, :create]
  
  
  def show
  end
  
  def new
    @new_user = User.new
    render layout: "login"
  end
  
  def create
    @new_user = User.new(params[:user])
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to "/profile"
    else
      render "new", layout: "login"
    end
  end
  
end
