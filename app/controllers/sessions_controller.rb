class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def login
    if helpers.logged_in?
      redirect_to rooms_path
    else
      render "login"
    end
  end

  def create
    user_access = UserAccess.find_by(user_access_username_params)

    if !!user_access && user_access.authenticate(user_access_password_params[:password])
      session[:user_id] = user_access.user_id
      redirect_to rooms_path
    else
      message = "Username and Password combination is invalid"
      redirect_to login_path, notice: message
    end
  end

  private

  def user_access_username_params
    params.require(:user_access).permit(:username)
  end

  def user_access_password_params
    params.require(:user_access).permit(:password)
  end
end
