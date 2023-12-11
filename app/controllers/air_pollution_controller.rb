class AirPollutionController < ApplicationController
  before_action :set_location

  def index
    # @air_pollution_data = AirPollutionData.where(location_id: @location.id).last
    # render json: @air_pollution_data
     # Make API request to OpenWeatherMap
     location = Location.find(params[:location_id])

    # Ensure that the location is found before making the API request
    if location.present?
      latitude = location.latitude
      longitude = location.longitude

      # Make API request to OpenWeatherMap
      response = RestClient.get("https://api.openweathermap.org/data/2.5/air_pollution?lat=#{latitude}&lon=#{longitude}&appid=#{ENV['OPENWEATHERMAP_API_KEY']}")

      # Parse and process the API response
      data = JSON.parse(response.body)
      aqi = data['list'].first['main']['aqi']

      # Create or update AirPollutionData record
      AirPollutionData.create(location_id: location.id, aqi: aqi)
    else
      # Handle the case when the location is not found
      render json: { error: 'Location not found' }, status: :not_found
    end
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end
end
