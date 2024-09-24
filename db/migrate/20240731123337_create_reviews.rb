class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :eatery_id
      t.integer :lodging_id

      t.timestamps
    end
  end
end
