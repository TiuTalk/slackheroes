require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    xit { is_expected.to belong_to(:team) }
    it do
      is_expected.to \
        have_many(:reactions_sent).
        class_name(UserReaction).
        inverse_of(:sender)
    end
    it do
      is_expected.to \
        have_many(:reactions_received).
        class_name(UserReaction).
        inverse_of(:receiver)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:avatar) }

    it { is_expected.to validate_uniqueness_of(:uid) }
  end
end
