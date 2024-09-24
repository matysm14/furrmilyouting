class CreateLCatetories < ActiveRecord::Migration[6.1]
  def change
    create_table :l_catetories do |t|
      t.string :name​

      t.timestamps
    end
  end
end
