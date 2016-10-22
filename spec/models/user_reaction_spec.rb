require 'rails_helper'

RSpec.describe UserReaction, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).inverse_of(:reactions) }
    it { is_expected.to belong_to(:emoji).inverse_of(:reactions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:emoji) }
    it { is_expected.to validate_presence_of(:message_uid) }
    it { is_expected.to validate_presence_of(:action) }

    it { is_expected.to validate_inclusion_of(:action).in_array(%w(sent received)) }
  end
end
