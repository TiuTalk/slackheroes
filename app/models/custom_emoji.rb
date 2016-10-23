class CustomEmoji < ApplicationRecord
  validates :name, :url, presence: true
  validates :name, uniqueness: { scope: :team_id }

  belongs_to :team
end
