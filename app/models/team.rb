class Team < ApplicationRecord
  validates :slack_id, :name, :domain, presence: true
  validates :slack_id, :domain, uniqueness: true

  def to_param
    domain
  end
end
