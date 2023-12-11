require 'rest-client'

class GeocodingService
  OPENWEATHERMAP_GEOCODING_API = 'https://api.openweathermap.org/geo/1.0/direct'

  def initialize(api_key)
    @api_key = api_key
  end

  def fetch_location(city_name)
    response = RestClient.get(OPENWEATHERMAP_GEOCODING_API, params: { q: city_name, appid: @api_key })

    json_response = JSON.parse(response.body)
    extract_location_data(json_response.first)
  end

  private

  def extract_location_data(data)
    { name: data['name'], latitude: data['lat'], longitude: data['lon'], state: data['state'], country: data['country']}
  end
end
