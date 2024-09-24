class LCatetory < ApplicationRecord
  has_many :lodging_categories​
  has_many :lodging, through: :lodging_categories​
  has_many :initial_category_lodgings
end
