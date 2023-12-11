class AddStateAndCountryToLocations < ActiveRecord::Migration[7.1]
  def change
    add_column :locations, :state, :string
    add_column :locations, :country, :string
  end
end
