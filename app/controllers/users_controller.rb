class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def create
    user_params
    user_access_params

    begin
      @user, @user_access = User.create_user_and_access(params[:username], params[:password], params[:name])
    rescue ActiveRecord::RecordNotUnique
      message = "Username already exists"
      redirect_to register_path, notice: message
      return
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:name)
  end

  def user_access_params
    params.require(:username)
    params.require(:password)
  end
end
