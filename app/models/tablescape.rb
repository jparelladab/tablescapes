class Tablescape < ApplicationRecord
  belongs_to :user
  has_many :items
  validates :name, presence: true
  validates :price_per_person, presence: true
  validates :description, presence: true
  validates :tag, presence: true
  validates :location, presence: true
end
