class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :require_moderator

  def login(user)
    session[:session_token]=user.reset_token
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?(user)
    !!current_user
  end

  def logout
    current_user.reset_token
    session[:session_token]= nil
  end

  def require_login
    unless current_user
      flash.now[:errors] =["user is not logged in"]
      redirect_to new_session_url
    end
  end

  def require_moderator(sub)
    if sub.moderator_id != current_user.id
      flash.now[:errors] =["only the moderator can edit the sub"]
      redirect_to sub_url(sub)
    end 
  end
end
