class ParkComment < ApplicationRecord

  belongs_to :customer
  belongs_to :park

end
