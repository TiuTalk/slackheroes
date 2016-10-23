require 'rails_helper'

RSpec.describe ReactionImporterJob, type: :job do
  describe '#perform' do
    it 'call a ReactionImporterService with the user reaction args'  do
      sender = create(:user)
      receiver = create(:user)
      expect(ReactionImporterService).to \
        receive(:call).
        with(
          receiver: receiver,
          sender: sender,
          message_uid: '123213312',
          emoji: ':smile:'
        )
      described_class.perform_now(
        receiver: receiver,
        sender: sender,
        message_uid: '123213312',
        emoji: ':smile:'
      )
    end
  end

end
