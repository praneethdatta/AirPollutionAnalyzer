class AddColumnsToAirPollutionData < ActiveRecord::Migration[7.1]
  def change
    add_column :air_pollution_data, :co, :float
    add_column :air_pollution_data, :no2, :float
    add_column :air_pollution_data, :o3, :float
    add_column :air_pollution_data, :so2, :float
    add_column :air_pollution_data, :pm2_5, :float
    add_column :air_pollution_data, :pm10, :float
  end
end