class AirPollutionData < ApplicationRecord
  belongs_to :location

  validates :location_id, presence: true
  validates :aqi, presence: true

  scope :average_aqi_per_month_per_location, -> {
    select('location_id, EXTRACT(MONTH FROM created_at) as month, AVG(aqi) as average_aqi')
      .group('location_id, EXTRACT(MONTH FROM created_at)')
  }

  scope :average_aqi_per_location, -> {
    select('location_id, AVG(aqi) as average_aqi')
      .group('location_id')
  }

  scope :average_aqi_per_state, -> {
    joins(:location)
      .select('locations.state, AVG(air_pollution_data.aqi) as average_aqi')
      .group('locations.state')
  }
end
