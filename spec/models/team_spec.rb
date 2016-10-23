require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:slack_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:domain) }
    it { is_expected.to validate_uniqueness_of(:slack_id) }
    it { is_expected.to validate_uniqueness_of(:domain) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:user_reactions) }
    it { is_expected.to have_many(:custom_emojis) }
  end
end
