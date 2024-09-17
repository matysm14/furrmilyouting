class CreateLodgings < ActiveRecord::Migration[6.1]
  def change
    create_table :lodgings do |t|
      t.string :lodging_name
      t.string :address
      t.string :phone_number
      t.text :home_page
      t.timestamps
    end
  end
end
