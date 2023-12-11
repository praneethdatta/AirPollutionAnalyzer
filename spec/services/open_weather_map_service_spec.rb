require 'rails_helper'
require 'webmock/rspec'

RSpec.describe OpenWeatherMapService do
  describe '.get_air_pollution_data' do
    let(:latitude) { 19.0760 }
    let(:longitude) { 72.8777 }
    let(:api_key) { 'test_api_key' }

    it 'fetches air pollution data from the OpenWeatherMap API' do
      stub_request(:get, /api.openweathermap.org/)
        .to_return(body: File.read('spec/fixtures/open_weather_map_response.json'), status: 200, headers: { 'Content-Type': 'application/json' })

      data = OpenWeatherMapService.get_air_pollution_data(latitude, longitude)

      expect(data).not_to be_empty
      expect(data['list']).to be_an(Array)
    end
  end
end
