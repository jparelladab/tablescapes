class Tablescape < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many_attached :photos
  validates :name, presence: true
  validates :price_per_person, presence: true
  validates :description, presence: true
  validates :tag, presence: true
  validates :location, presence: true
  validates :image, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
