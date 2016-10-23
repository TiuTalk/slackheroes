require 'rails_helper'

RSpec.describe ReactionsImporterJob, type: :job do
  describe '#perform' do
    it 'call a ReactionsImporterService with the user and page'  do
      user = create(:user)
      expect(ReactionsImporterService).to receive(:call).with(user, 1)
      described_class.perform_now(user, 1)
    end
  end
end
