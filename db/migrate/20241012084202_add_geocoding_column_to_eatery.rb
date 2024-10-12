class AddGeocodingColumnToEatery < ActiveRecord::Migration[6.1]
  def change
    
    add_column :eateries, :latitude, :float, null: false, default: 0
    add_column :eateries, :longitude, :float, null: false, default: 0
  end
end
