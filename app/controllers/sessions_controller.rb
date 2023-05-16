class SessionsController < ApplicationController
  def create
    @user_access = UserAccess.find_by(username: params[:username])

    if !!@user_access && @user_access.authenticate(params[:password])
      session[:user_id] = @user_access.user_id
      redirect_to :controller => "users", :action => "show", :id => @user_access.user_id
    else
      message = "Username and Password combination is invalid"
      redirect_to login_path, notice: message
    end
  end
end
