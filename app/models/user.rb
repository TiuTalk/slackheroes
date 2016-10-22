class User < ApplicationRecord
  # Associations
  has_many :reactions_sent, class_name: UserReaction, inverse_of: :sender
  has_many :reactions_received, class_name: UserReaction, inverse_of: :receiver

  # Validations
  validates :uid, :name, :username, :avatar, presence: true
  validates :uid, uniqueness: true
end
