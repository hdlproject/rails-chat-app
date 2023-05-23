class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to login_path unless helpers.logged_in?
  end

  # before_action :skip_session, if: :api_request?
  #
  # protected
  #
  # def skip_session
  #   request.session_options[:drop] = true
  # end
end
