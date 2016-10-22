require 'rails_helper'

RSpec.describe CustomEmojiImporterJob, type: :job do
  describe '#perform' do
    it 'call emoji_importer_service' do
      expect(CustomEmojiImporterService).to receive(:call)
      described_class.perform_now
    end
  end
end
