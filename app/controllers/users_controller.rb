class UsersController < ApplicationController
  def create
    begin
      user, user_access = User.create_user_and_access(user_params, user_access_params)

      redirect_to login_path
    rescue ActiveRecord::RecordNotUnique
      message = "Username already exists"
      redirect_to register_path, notice: message
      return
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def user_access_params
    params.require(:user).permit(:username, :password)
  end
end
