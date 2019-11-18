class Item < ApplicationRecord
  belongs_to :tablescape
  validates :name, presence: true
  validates :category, presence: true
end
