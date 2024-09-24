class CreateLodgings < ActiveRecord::Migration[6.1]
  def change
    create_table :lodgings do |t|
      t.string :lodging_name
      t.string :address
      t.string :phone_number
      t.text :home_page
      t.integer :user_id
      t.boolean :approved
      t.integer :review_id
      
      t.timestamps
    end
  end
end
