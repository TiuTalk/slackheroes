class User < ApplicationRecord
  # Associations
  has_many :reactions, class_name: UserReaction, inverse_of: :user

  # Validations
  validates :uid, :name, :username, :avatar, presence: true
  validates :uid, uniqueness: true
end
