module ApplicationHelper
  def flash_classes(name)
    if name == 'notice'
      "alert alert-info"
    elsif name == 'alert'
      "alert alert-danger"
    else
      "alert"
    end
  end
  def logged_in?
    !current_user.nil?
  end
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end

end
