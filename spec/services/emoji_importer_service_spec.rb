require 'rails_helper'

RSpec.describe EmojiImporterService, type: :service do
  describe '#call', vcr: true do
    it 'creates an emoji for every emoji registed for the team' do
      expect do
        described_class.call
      end.to change(Emoji, :count).from(0).to(432)
    end

    it 'does not create when run a second time' do
      described_class.call
      expect do
        described_class.call
      end.not_to change(Emoji, :count).from(432)
    end
  end
end