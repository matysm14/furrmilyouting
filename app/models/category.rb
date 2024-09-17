class Category < ApplicationRecord
  has_many :eatery_categories
  has_many :eateries, through: :eatery_categories
  has_many :initial_categories
end
