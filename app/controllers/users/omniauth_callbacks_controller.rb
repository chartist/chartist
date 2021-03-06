class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_oauth(request.env["omniauth.auth"])
    provider = @user.provider

    if @user.persisted?
      sign_in @user
      # sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => provider.capitalize) if is_navigational_format?
      redirect_to charts_path
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.find_for_oauth(request.env["omniauth.auth"])
    provider = @user.provider

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => provider.capitalize) if is_navigational_format?
      redirect_to charts_path
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  alias_method :linkedin, :facebook

  # alias_method :facebook, :google_oauth2



end
