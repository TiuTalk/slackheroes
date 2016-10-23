require 'rails_helper'

RSpec.describe UserImporterService, type: :service do
  describe '#call', vcr: true do
    let(:team) { create :team, token: Rails.application.secrets.slack_api_token }

    subject { UserImporterService.new(team) }

    it 'creates an user for every active user on the team' do
      expect do
        subject.call
      end.to change(User, :count).from(0).to(54)
    end

    it 'does not create duplicated users' do
      subject.call
      expect do
        subject.call
      end.not_to change(User, :count).from(54)
    end

    it 'enqueue job to process user reactions from user' do
      expect(UsersReactionImporterJob).to receive(:perform_later).exactly(1).times
      subject.call
    end
  end
end
