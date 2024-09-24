class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :eateries, dependent: :destroy
  has_many :lodgings, dependent: :destroy
  #has_many :users, dependent: :destroy

end
