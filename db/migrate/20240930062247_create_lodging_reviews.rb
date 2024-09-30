class CreateLodgingReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :lodging_reviews do |t|
      t.integer :star
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :lodging_id

      t.timestamps
    end
  end
end
