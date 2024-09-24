class Lodging < ApplicationRecord

  belongs_to :user
  belongs_to :admin, optional: true
  has_many :reviews, dependent: :destroy
  has_many :lodging_categories, dependent: :destroy
  has_many :l_categories, through: :lodging_categories​

  def self.search_for(content, method)
    if method == 'perfect'
      Lodging.where(address: content)
    elsif method == 'partial'
      Lodging.where('address LIKE ?', '%'+content+'%')
    else
      Lodging.all
    end

  end
end
