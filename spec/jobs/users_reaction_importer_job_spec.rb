require 'rails_helper'

RSpec.describe UsersReactionImporterJob, type: :job do
  describe '#perform' do
    it 'enqueue job for every user in database' do
      create(:user, uid: 'U026SEPC5')
      create(:user, uid: 'U03UP3M5R')
      create(:user, uid: 'U050W026V')
      create(:user, uid: 'U042NNY51')

      described_class.perform_now
      expect(ReactionsImporterJob).to have_been_enqueued.exactly(4).times
    end
  end
end
