class UserReaction < ApplicationRecord
  # Associations
  belongs_to :receiver, inverse_of: :reactions_received, foreign_key: :user_receiver_id, class_name: User
  belongs_to :sender, inverse_of: :reactions_sent, foreign_key: :user_sender_id, class_name: User
  belongs_to :team

  # Validations
  validates :receiver, :emoji, :sender, :message_uid, presence: true

  def self.top
    group(:emoji).order('count_id DESC').limit(1).count(:id)
  end
end
