class CreateLodgingFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :lodging_favorites do |t|
      t.integer :user_id
      t.integer :lodging_id

      t.timestamps
    end
  end
end
