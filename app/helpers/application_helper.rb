module ApplicationHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    if session[:user_id] != nil 
      return true
    else
      return false
    end
  end

  private
  def authenticate_user
    unless current_user
      redirect_to new_session_path, danger: "Please log in."
    end
  end

end
