include Devise::Controllers::Rememberable
class Users::OmniauthCallbacksController < ApplicationController

  skip_before_filter :authenticate_user!

  def google_oauth2
    request.env["omniauth.auth"].extra.raw_info.hd
    if request.env["omniauth.auth"].extra.raw_info.hd != "madebymany.co.uk"
      flash[:alert] = "You are not one of The Many, go away!"
      redirect_to new_user_session_path
    else
      @user = User.find_or_create_by_google(request.env["omniauth.auth"].info)
      sign_in_and_redirect @user, :event => :authentication
      remember_me(@user)
    end
  end

  def failure
    @message = OmniAuth::Strategies::OAuth2::CallbackError
  end

end
