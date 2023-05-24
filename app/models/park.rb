class Park < ApplicationRecord

  has_many :park_comments, dependent: :destroy
  has_many :park_tags, dependent: :destroy
  has_many :tags, through: :park_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 50 }
  validates :area, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: {  minimum: 2, maximum: 30 }
  validates :image, presence: true

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

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def park_commented_by?(customer)
    park_comments.exists?(customer_id: customer.id)
  end

end
