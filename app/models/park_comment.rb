class ParkComment < ApplicationRecord

  belongs_to :customer
  belongs_to :park

  validates :comment, presence: true, length: { minimum: 5, maximum: 50 }
  validates :star, presence: true


  def avg_score
    unless self.comments.empty?
      comments.average(:rate_id).round(1)
    else
      0.0
    end
  end

 def avg_score_percentage
   unless self.comments.empty?
     comments.average(:rate_id).round(1).to_f*100/5
   else
     0.0
   end
 end
end
