module SessionsHelper
  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    return nil if session[:session_token].nil?
    @user ||= User.find_by(session_token: session[:session_token])
    @user
  end

  def require_current_user!
    redirect_to login_url unless logged_in?
  end

  def require_logged_out!
    redirect_to root_url if logged_in?
  end

  def current_user?(user)
    !current_user.nil? && current_user.id == user.id 
  end

end
