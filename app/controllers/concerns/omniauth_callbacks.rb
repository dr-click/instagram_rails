class OmniauthCallbacks

  def initialize(provider, auth_response)
    @provider = provider
    @auth = auth_response
  end

  def load_user
    check_provider_and_return_user
  end

  #######
  private
  #######

  def check_provider_and_return_user
    user = User.new
    case @provider
    when "instagram"
      authentication = Authentication.check_provider_existance(@auth)
      if !authentication.new_record?
        user = authentication.user
        authentication.update_info(@auth)
        authentication.save
      else
        user = User.new
        user = user.link_to_social_networks(@auth)
        user.force_remember_me
      end
    end
    user
  end
end
