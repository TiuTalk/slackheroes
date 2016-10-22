require 'rails_helper'

RSpec.describe Emoji, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:reactions).class_name(UserReaction).inverse_of(:emoji) }
  end

  describe 'validations' do
    subject { build(:emoji) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
