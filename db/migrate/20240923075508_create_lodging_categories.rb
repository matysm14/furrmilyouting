class CreateLodgingCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :lodging_categories do |t|
      t.references :lodging, foreign_key: true
      t.references :l_category, foreign_key: true

      t.timestamps
    end
  end
end
