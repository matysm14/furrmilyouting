class CreateEateryCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :eatery_categories do |t|
      t.references :eatery, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
