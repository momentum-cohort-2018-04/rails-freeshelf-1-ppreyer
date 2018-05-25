class ApplicationController < ActionController::Base
  # Allows you to use current user in the views
  helper_method :current_user
  private

  def current_user    
    # if the session is not empty...
    if session[:user_id]
      # if I have the variable @user use that if not set it to this...
      @user ||= User.find(session[:user_id])
      return @user
    end
  end

  def require_login
    if current_user.nil?
      redirect_to root_url, notice: "You need to log in to do that."
    end
  end
end
