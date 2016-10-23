class Team < ApplicationRecord
  validates :slack_id, :name, :domain, presence: true
  validates :slack_id, :domain, uniqueness: true

  has_many :custom_emojis, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :user_reactions, dependent: :destroy

  def to_param
    domain
  end
end
