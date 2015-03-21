class LoginController < ApplicationController
  
  skip_before_filter :require_login, only: [:login, :verify]
  
  def login
    @errors = {}
    render layout: "login"
  end
  
  def verify
    @errors = {}
    if @user = User.find_by_name(params[:name])
      if @user.try(:authenticate, params[:password])
        session[:user_id] = @user.id
        redirect_to "/profile"
      else
        @errors[:password] = "Invalid Password"
        render "login", layout: "login"
      end
    else
      @errors[:name] = "User Not Found"
      render "login", layout: "login"
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to "/login"
  end
  
end
