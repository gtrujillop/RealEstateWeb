class ApplicationController < ActionController::Base
  before_filter :require_login, :except => [:not_authenticated]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def not_authenticated
    redirect_to login_path, :alert => "Login required !." 
  end
end
