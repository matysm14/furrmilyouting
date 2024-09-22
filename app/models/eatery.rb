class Eatery < ApplicationRecord

  belongs_to :user
  belongs_to :admin, optional: true
  has_many :reviews, dependent: :destroy
  has_many :eatery_categories, dependent: :destroy
  has_many :categories, through: :eatery_categories

  def self.search_for(content, method)
    if method == 'perfect'
      Eatery.where(address: content)
    elsif method == 'partial'
      Eatery.where('address LIKE ?', '%' + content + '%')
    else
      Eatery.all
    end
  end
end
