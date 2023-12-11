class GeocodingWorker
  include Sidekiq::Worker

  def perform(location_id)
    location = Location.find(location_id)
    location.update_geocoding_info
  end
end
