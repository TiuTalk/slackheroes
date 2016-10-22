class UserReaction < ApplicationRecord
  # Associations
  belongs_to :user, inverse_of: :reactions
  belongs_to :emoji, inverse_of: :reactions

  # Validations
  validates :user, :emoji, :message_uid, :action, presence: true
  validates :action, inclusion: { in: %w(sent received) }
end
