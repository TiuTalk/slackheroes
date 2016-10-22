require 'rails_helper'

RSpec.describe UserReaction, type: :model do
  describe 'associations' do
    it do
      is_expected.to \
        belong_to(:sender).
        inverse_of(:reactions_sent).
        class_name(User).
        with_foreign_key(:user_sender_id)
    end
    it do
      is_expected.to \
        belong_to(:receiver).
        inverse_of(:reactions_received).
        class_name(User).
        with_foreign_key(:user_receiver_id)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:receiver) }
    it { is_expected.to validate_presence_of(:sender) }
    it { is_expected.to validate_presence_of(:message_uid) }
    it { is_expected.to validate_presence_of(:emoji) }
  end
end
