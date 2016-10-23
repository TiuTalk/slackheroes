require 'rails_helper'

RSpec.describe ReactionImporterService, type: :service do
  describe '#call' do
    let(:team) { create :team }
    let(:user) { create(:user, uid: 'U0EK98GN5', team: team) }
    let(:active_users)  do
      [
        create(:user, uid: 'U026SEPC5'),
        create(:user, uid: 'U03UP3M5R'),
        create(:user, uid: 'U050W026V'),
        create(:user, uid: 'U042NNY51')
      ]
    end

    it 'creates an user reaction for the given params' do
      sender = active_users.first

      expect do
        described_class.call(
          receiver: user,
          sender: sender,
          emoji: 'emoji',
          message_uid: '123123123124122'
        )
      end.to change(UserReaction, :count).from(0).to(1)
    end

    it 'does not create duplicated users' do
      sender = active_users.first
      create(:user_reaction,
             receiver: user,
             sender: sender,
             team: user.team,
             emoji: 'smile',
             message_uid: '12345'
            )

      expect do
        described_class.call(
          receiver: user,
          sender: sender,
          emoji: 'smile',
          message_uid: '12345'
        )
      end.not_to change(UserReaction, :count).from(1)
    end

    it 'extract skin theme from emoji' do
      sender = active_users.first
      user_action = described_class.call(
        receiver: user,
        sender: sender,
        emoji: 'thumbsup::skin-tone-5',
        message_uid: '12345'
      )
      expect(user_action.emoji).to eql('thumbsup')
    end

    it 'removes point in message uid' do
      sender = active_users.first
      user_action = described_class.call(
        receiver: user,
        sender: sender,
        emoji: 'thumbsup',
        message_uid: '12345.19312'
      )
      expect(user_action.message_uid).to eql('1234519312')
    end
  end
end
