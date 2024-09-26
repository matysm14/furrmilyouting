class Review < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  belongs_to :eatery
  #belongs_to :lodging

  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/default-image.jpg')
    image.attach(io: File.open(file_path), filename: 'udefault-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
