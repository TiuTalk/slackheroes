require 'rails_helper'

RSpec.describe CustomEmojiImporterJob, type: :job do
  describe '#perform' do
    let(:team) { create :team }

    it 'call emoji_importer_service' do
      new_object = double(CustomEmojiImporterService)
      expect(CustomEmojiImporterService).to receive(:new).with(team).and_return(new_object)
      expect(new_object).to receive(:call)
      described_class.perform_now(team)
    end
  end
end
