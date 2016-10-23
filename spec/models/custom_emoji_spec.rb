require 'rails_helper'

RSpec.describe CustomEmoji, type: :model do
  describe 'validations' do
    subject { build(:custom_emoji) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:team_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:team) }
  end
end
