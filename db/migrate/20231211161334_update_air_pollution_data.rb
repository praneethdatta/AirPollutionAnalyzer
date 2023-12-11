class UpdateAirPollutionData < ActiveRecord::Migration[7.1]
  def up
    AirPollutionData.find_each do |data|
      data.update(
        co: data.aqi * 0.1, # Example calculation, adjust as needed
        no2: data.aqi * 0.2,
        o3: data.aqi * 0.3,
        so2: data.aqi * 0.4,
        pm2_5: data.aqi * 0.5,
        pm10: data.aqi * 0.6
      )
    end
  end

  def down
    # Reverse the update if needed
    AirPollutionData.update_all(
      co: nil,
      no2: nil,
      o3: nil,
      so2: nil,
      pm2_5: nil,
      pm10: nil
    )
  end
end
