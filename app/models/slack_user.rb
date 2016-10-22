class SlackUser < ApplicationRecord
  # Associations
  # has_many :reactions, class_name: UserReaction

  # Validations
  validates :uid, :name, :username, :avatar, presence: true
  validates :uid, uniqueness: true
end
