module UsersHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end
end
