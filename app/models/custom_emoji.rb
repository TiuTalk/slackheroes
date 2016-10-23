class CustomEmoji < ApplicationRecord
  validates :name, :url, presence: true
  validates :name, uniqueness: true

  belongs_to :team
end
