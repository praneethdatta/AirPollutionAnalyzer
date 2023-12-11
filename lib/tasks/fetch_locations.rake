# Explicitly require the Rails environment
# require File.expand_path('../config/environment', __dir__)
require File.expand_path('../../config/environment', __dir__)

# Explicitly require the GeocodingService
# require_relative '../app/services/geocoding_service'
require_relative '../../app/services/geocoding_service'

namespace :fetch_locations do
  desc 'Fetch and save locations'
  task :execute do
    api_key = ENV['OPENWEATHERMAP_API_KEY']
    geocoding_service = GeocodingService.new(api_key)

    cities = ['Mumbai', 'Delhi', 'Bangalore', 'Kolkata', 'Chennai', 'Hyderabad', 'Ahmedabad', 'Pune', 'Surat', 'Jaipur', 'Lucknow', 'Kanpur', 'Nagpur', 'Indore', 'Thane', 'Bhopal', 'Visakhapatnam', 'Pimpri-Chinchwad', 'Patna', 'Vadodara']

    cities.each do |city_name|
      location_data = geocoding_service.fetch_location(city_name)
      Location.create(location_data)
    end

    puts 'Locations fetched and saved successfully.'
  end
end
