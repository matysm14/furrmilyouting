class ChangeApprovedDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default :eateries, :approved, from: nil, to: false
  end
end