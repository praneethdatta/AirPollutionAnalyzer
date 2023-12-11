class Location < ApplicationRecord
  # has_many :air_pollution_data, dependent: :destroy
  has_many :air_pollution_data, class_name: 'AirPollutionData', dependent: :destroy

  validates :name, :latitude, :longitude, presence: true
  def update_geocoding_info
    response = fetch_geocoding_data

    if response.code == 200
      update_location_info(response)
    else
      Rails.logger.error("Error fetching geocoding data for #{name}: #{response.body}")
    end
  rescue StandardError => e
    Rails.logger.error("Error updating geocoding info for #{name}: #{e.message}")
  end

  private

  def fetch_geocoding_data
    api_key = ENV['OPENWEATHERMAP_API_KEY']
    geocoding_url = "https://api.openweathermap.org/geo/1.0/direct?q=#{name}&limit=1&appid=#{api_key}"

    RestClient.get(geocoding_url)
  end

  def update_location_info(response)
    data = JSON.parse(response.body).first

    update(
      latitude: data['lat'],
      longitude: data['lon'],
      country: data['country'],
      state: data['state'],
      name: data['name']
    )
  end
end
