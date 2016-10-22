require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    xit { is_expected.to belong_to(:team) }
    it { is_expected.to have_many(:reactions).class_name(UserReaction) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:avatar) }

    it { is_expected.to validate_uniqueness_of(:uid) }
  end
end
