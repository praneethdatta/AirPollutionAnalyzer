class OpenWeatherMapService
  include HTTParty

  base_uri 'http://api.openweathermap.org/data/2.5'

  def self.get_air_pollution_data(latitude, longitude)
    api_key = ENV['OPENWEATHERMAP_API_KEY']
    endpoint = '/air_pollution'

    options = {
      query: {
        lat: latitude,
        lon: longitude,
        appid: api_key
      }
    }

    response = get(endpoint, options)

    handle_response(response)
  end

  private

  def self.handle_response(response)
    if response.success?
      parse_response(response)
    else
      handle_error(response)
    end
  end

  def self.parse_response(response)
    JSON.parse(response.body)
  end

  def self.handle_error(response)
    # Log or handle the error as needed
    raise "OpenWeatherMap API Error: #{response.code} - #{response.body}"
  end
end
