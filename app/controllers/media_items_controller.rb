class MediaItemsController < ApplicationController
	# before_action :authenticate_user!

	def index
		instagram_client = InstagramClient.new(current_user.instagram_token)
		@media_items = MediaItem.load_collection(instagram_client.recent_media)
	end
end
