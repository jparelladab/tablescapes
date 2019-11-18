class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tablescape
  validates :date_from, presence: true
  validates :date_to, presence: true
  validates :total_price, presence: true
  validates :attendees, presence: true
end
