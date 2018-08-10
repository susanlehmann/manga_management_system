class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback("facebook")
  end

  def google_oauth2
    callback("google_oauth2")
  end

  def callback(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      flash[:error] = t("social_error")
      redirect_to new_user_registration_url
    end
  end
end
