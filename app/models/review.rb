class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5], message: "%{value} is not valid. Must be between 1 (worst) - 5 (best)" }
end
