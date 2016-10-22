class Emoji < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :url, presence: true
end
