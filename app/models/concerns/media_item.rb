class MediaItem
  attr_accessor :standard_resolution_url, :low_resolution_url

  def initialize(standard_resolution_url, low_resolution_url)
    @standard_resolution_url = standard_resolution_url
    @low_resolution_url = low_resolution_url
  end

  def self.load_collection(items)
    list = []
    items.each do |item|
      list << MediaItem.new(item.images.standard_resolution.try(:url), item.images.low_resolution.try(:url))
    end
    list
  end
end
