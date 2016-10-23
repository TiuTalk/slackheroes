require 'rails_helper'

RSpec.describe ReactionsImporterService, type: :service do
  describe '#call', vcr: true do
    let(:user) { create(:user, uid: 'U0EK98GN5') }
    let(:active_users)  do
      create(:user, uid: 'U026SEPC5')
      create(:user, uid: 'U03UP3M5R')
      create(:user, uid: 'U050W026V')
      create(:user, uid: 'U042NNY51')
    end

    it 'enqueue a ReactionImportJob for each reaction' do
      active_users

      expect(ReactionImporterJob).to receive(:perform_later).exactly(18).times
      expect(ReactionsImporterJob).to \
        receive(:perform_later).
        with(user, 2).
        exactly(1).times
      described_class.call(user, 1)
    end
  end
end
