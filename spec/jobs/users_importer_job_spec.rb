require 'rails_helper'

RSpec.describe UsersImporterJob, type: :job do
  describe '#perform' do
    let(:team) { create :team }

    it 'call user_importer_service' do
      new_object = double(UserImporterService)
      expect(UserImporterService).to receive(:new).with(team).and_return(new_object)
      expect(new_object).to receive(:call)
      described_class.perform_now(team)
    end
  end
end
