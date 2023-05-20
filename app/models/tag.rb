class Tag < ApplicationRecord

  has_many :park_tags, dependent: :destroy

  has_many :parks, through: :park_tags, dependent: :destroy
  
  validates :name, presence: true

end
