class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :eateries
  has_many :lodgings
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :lodging_favorites, dependent: :destroy
  #belongs_to :admin
  has_many :lodging_reviews, dependent: :destroy

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/user_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'user_image.jpg', content_type: 'image/jpeg')
  end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end



end
