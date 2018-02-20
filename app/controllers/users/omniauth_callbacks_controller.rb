class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def instagram
    social_linking
  end

  def social_linking
    auth = request.env["omniauth.auth"]
    provider = auth[:provider]
    user = OmniauthCallbacks.new(provider, auth).load_user
    user.update_info(auth)
    user.save!
    signin_with_social_network(user, :signed_in, provider)
  end

  def failure
    redirect_to root_path, alert: params[:error]
  end

  #######
  private
  #######

  def signin_with_social_network(user, type, provider)
    user.remember_me = true
    sign_in_and_redirect user, :event => :authentication #this will throw if user is not activated
    set_flash_message(:notice, type, :kind => provider) if is_navigational_format?
  end
end
