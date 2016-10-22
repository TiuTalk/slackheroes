require 'rails_helper'

RSpec.describe Emoji, type: :model do
  describe 'Validations' do
    subject { build(:emoji) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
