require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:slack_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:domain) }
    it { is_expected.to validate_uniqueness_of(:slack_id) }
    it { is_expected.to validate_uniqueness_of(:domain) }
  end
end
