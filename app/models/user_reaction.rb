class UserReaction < ApplicationRecord
  # Associations
  belongs_to :user, inverse_of: :reactions

  # Validations
  validates :user, :message_uid, :action, presence: true
  validates :action, inclusion: { in: %w(sent received) }
end
