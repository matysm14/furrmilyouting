class Eatery < ApplicationRecord
  belongs_to :user
  belongs_to :admin, optional: true
  has_many :reviews, dependent: :destroy
end
