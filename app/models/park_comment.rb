class ParkComment < ApplicationRecord

  belongs_to :customer
  belongs_to :park

  validates :comment, presence: true, length: { minimum: 5, maximum: 50 }
  validates :star, presence: true

end
