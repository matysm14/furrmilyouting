class LCategory < ApplicationRecord
  has_many :lodging_categories​
  has_many :lodgings, through: :lodging_categories
  has_many :initial_category_lodgings
end
