module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (remember_token = cookies[:remember_token])
      user = User.find_by(remember_token: remember_token)
      @current_user ||= user if remember_token == user.remember_token
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    forget(current_user)
    reset_session
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize
    redirect_to root_path unless logged_in?
  end

  def remember(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:remember_token)
  end
end
