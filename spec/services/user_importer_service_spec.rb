require 'rails_helper'

RSpec.describe UserImporterService, type: :service do
  describe '#call', vcr: true do
    it 'creates an user for every active user on the team' do
      expect do
        described_class.call
      end.to change(User, :count).from(0).to(54)
    end

    it 'does not create duplicated users' do
      described_class.call
      expect do
        described_class.call
      end.not_to change(User, :count).from(54)
    end
  end
end
