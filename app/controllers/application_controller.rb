class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to login_path unless helpers.logged_in?
  end
end
