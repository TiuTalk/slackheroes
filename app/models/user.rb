class User < ApplicationRecord
  # Associations
  has_many :reactions_sent, class_name: UserReaction, foreign_key: :user_sender_id, inverse_of: :sender
  has_many :reactions_received, class_name: UserReaction, foreign_key: :user_receiver_id, inverse_of: :receiver
  belongs_to :team

  # Validations
  validates :uid, :name, :username, :avatar, presence: true
  validates :uid, uniqueness: true
end
