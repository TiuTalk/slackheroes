require 'rails_helper'

RSpec.describe UsersImporterJob, type: :job do
  describe '#perform', vcr: true do
    it 'creates an user for every active user on the team' do
      expect do
        described_class.perform_now
      end.to change(User, :count).from(0).to(54)
    end
  end
end
