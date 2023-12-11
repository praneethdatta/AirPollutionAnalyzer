class AirPollutionImporter
  def self.import_data_for_all_locations
    Location.all.each do |location|
      air_pollution_data = OpenWeatherMapService.get_air_pollution_data(location.latitude, location.longitude)

      if air_pollution_data.present?
        save_air_pollution_data(location, air_pollution_data)
      else
        Rails.logger.warn("Air pollution data not available for location: #{location.name}")
      end
    end
  end

  private

  def self.save_air_pollution_data(location, air_pollution_data)
    Rails.logger.info("Importing air pollution data for location: #{location.name}")

    AirPollutionData.create!(
      aqi: air_pollution_data.dig('list', 0, 'main', 'aqi'),
      co: air_pollution_data.dig('list', 0, 'components', 'co'),
      no2: air_pollution_data.dig('list', 0, 'components', 'no2'),
      o3: air_pollution_data.dig('list', 0, 'components', 'o3'),
      so2: air_pollution_data.dig('list', 0, 'components', 'so2'),
      pm2_5: air_pollution_data.dig('list', 0, 'components', 'pm2_5'),
      pm10: air_pollution_data.dig('list', 0, 'components', 'pm10'),
      location: location
    )

    Rails.logger.info("Air pollution data imported for location: #{location.name}")
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Error saving air pollution data for location #{location.name}: #{e.message}")
  rescue StandardError => e
    Rails.logger.error("An unexpected error occurred: #{e.message}")
  end
end
