class CreateAirPollutionData < ActiveRecord::Migration[6.0]
  def change
    create_table :air_pollution_data do |t|
      t.references :location, null: false, foreign_key: true
      t.integer :aqi, null: false

      t.timestamps
    end
  end
end
