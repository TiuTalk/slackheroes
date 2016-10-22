class Emoji < ApplicationRecord
  # Associations
  has_many :reactions, class_name: UserReaction, inverse_of: :emoji

  # Validations
  validates :name, :url, presence: true
  validates :name, uniqueness: true
end
