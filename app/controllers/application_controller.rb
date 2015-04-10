class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  layout proc{|c| c.request.xhr? ? false : "application" }

  before_action :authenticate_user!

  helper_method :user_is_admin?
  def user_is_admin?
    user_signed_in? && current_user.is_admin?
  end

  helper_method :authenticate_admin!
  def authenticate_admin!
    redirect_to root_path unless user_is_admin?
  end

  helper_method :is_admin?
  def is_admin?
    false
  end

end
