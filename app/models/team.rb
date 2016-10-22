class Team < ApplicationRecord
  validates :slack_id, :name, presence: true
  validates :slack_id, uniqueness: true
end
