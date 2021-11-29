class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? # allows this method to be used as a helper method as well

  def current_user
    # ||= set if variable is not set, else do nothing
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    !!current_user
  end

end
