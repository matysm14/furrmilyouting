class AddGeocodingColumnToLodging < ActiveRecord::Migration[6.1]
  def change

    add_column :lodgings, :latitude, :float, null: false, default: 0
    add_column :lodgings, :longitude, :float, null: false, default: 0
  end
end
