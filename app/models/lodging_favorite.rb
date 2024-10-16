class LodgingFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :lodging

  validates :user_id, uniqueness: {scope: :lodging_id}
end
