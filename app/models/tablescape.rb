class Tablescape < ApplicationRecord
  belongs_to :user
  has_many :items
  has_one_attached :photo
  validates :name, presence: true
  validates :price_per_person, presence: true
  validates :description, presence: true
  validates :tag, presence: true
  validates :location, presence: true
  validates :image, presence: true
  # validates :photo, presence: true
  geocoded_by :location
  after_validation :geocode
end
