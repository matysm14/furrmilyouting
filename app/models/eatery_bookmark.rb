class EateryBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :eatery
  
  validates :user_id, uniqueness: { scope: :eatery_id }
end
