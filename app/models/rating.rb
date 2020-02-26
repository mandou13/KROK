class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates  :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
