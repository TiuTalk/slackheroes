class CustomEmoji < ApplicationRecord
  # Validations
  validates :name, :url, presence: true
  validates :name, uniqueness: true
end
