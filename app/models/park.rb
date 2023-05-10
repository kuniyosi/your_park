class Park < ApplicationRecord

  has_many :park_comments, dependent: :destroy

  has_one_attached :image

  def self.search(search_word)
    Park.where(['area LIKE ?', "#{search_word}"])
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
