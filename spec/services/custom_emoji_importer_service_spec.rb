require 'rails_helper'

RSpec.describe CustomEmojiImporterService, type: :service do
  let(:team) { create :team, token: Rails.application.secrets.slack_api_token }

  subject { CustomEmojiImporterService.new(team) }

  describe '#call', vcr: true do
    it 'creates an emoji for every emoji registed for the team' do
      expect do
        subject.call
      end.to change(CustomEmoji, :count).from(0).to(432)
    end

    it 'does not create when run a second time' do
      subject.call
      expect do
        subject.call
      end.not_to change(CustomEmoji, :count).from(432)
    end
  end
end
