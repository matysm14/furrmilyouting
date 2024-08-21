class CreateLodgings < ActiveRecord::Migration[6.1]
  def change
    create_table :lodgings do |t|

      t.timestamps
    end
  end
end
