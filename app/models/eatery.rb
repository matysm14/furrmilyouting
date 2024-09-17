class Eatery < ApplicationRecord
  belongs_to :user
  belongs_to :admin, optional: true
  has_many :reviews, dependent: :destroy
  has_many :eatery_categories, dependent: :destroy
  has_many :categories, through: :eatery_categories
  
  def self.looks(search, word)
    if search == "perfect_match"
      @eatery = Eatery.where("address LIKE?", "#{word}")
    elsif search == "forward_match"
      @eatery = Eatery.where("address LIKE?","#{word}%")
    elsif search == "backward_match"
      @eatery = Eatery.where("address LIKE?","%#{word}")
    elsif search == "partial_match"
      @eatery = Eatery.where("address LIKE?","%#{word}%")
    else
      @eatery = Eatery.all
    end
  end
end
