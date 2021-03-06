class Tablescape < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :name, presence: true
  validates :price_per_person, presence: true
  validates :description, presence: true
  validates :tag, presence: true
  validates :location, presence: true
  validates :image, presence: true
  # validates :photo, presence: true
  geocoded_by :location

  after_validation :geocode, if: :will_save_change_to_location?
  include PgSearch::Model
  pg_search_scope :search_by_tag,
    against: [:tag],
    using: {
      tsearch: { prefix: true }
    }
end
