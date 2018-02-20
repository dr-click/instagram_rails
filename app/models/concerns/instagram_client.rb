class InstagramClient
  def initialize(access_token)
    @client = Instagram.client(:access_token => access_token)
    @recent_media_items = nil
  end

  def recent_media
    fetch_recent_media
  end

  #######
  private
  #######

  def fetch_recent_media
    @recent_media_items ||= @client.user_recent_media
    @recent_media_items
  end
end
