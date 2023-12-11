# spec/services/air_pollution_importer_spec.rb
require 'rails_helper'

RSpec.describe AirPollutionImporter, :vcr do
  describe '.import_data_for_all_locations' do
    # Include the factory definition directly
    FactoryBot.define do
      factory :location do
        name { 'Test City' }
        latitude { 40.7128 }
        longitude { -74.0060 }
      end
    end

    let!(:location) { create(:location) }

    it 'imports air pollution data for all locations' do
      # Define sample data
      sample_air_pollution_data = {
        'list' => [
          'main' => { 'aqi' => 50 },
          'components' => {
            'co' => 0.5,
            'no2' => 10,
            'o3' => 25,
            'so2' => 5,
            'pm2_5' => 15,
            'pm10' => 20
          }
        ]
      }

      # Stub the OpenWeatherMapService to return sample data
      allow(OpenWeatherMapService).to receive(:get_air_pollution_data).and_return(sample_air_pollution_data)

      # Expect that running the import process changes the AirPollutionData count
      expect { AirPollutionImporter.import_data_for_all_locations }.to change { AirPollutionData.count }.by(1)
    end
  end
end
