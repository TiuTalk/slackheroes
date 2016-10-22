require 'rails_helper'

RSpec.describe EmojiImporterJob, type: :job do
  describe '#perform' do
    it 'call emoji_importer_service' do
      expect(EmojiImporterService).to receive(:call)
      described_class.perform_now
    end
  end
end
